package githubrepository_test

import (
	"context"
	"testing"
	"time"

	"github.com/omept/reposvc/internal/config"
	"github.com/omept/reposvc/internal/githubrepository"
	"github.com/omept/reposvc/internal/models"
	"github.com/omept/reposvc/pkg/log"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/mock"
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

type MockDB struct {
	mock.Mock
}

func (m *MockDB) Find(dest interface{}, conds ...interface{}) *gorm.DB {
	args := m.Called(dest, conds)
	return args.Get(0).(*gorm.DB)
}

func (m *MockDB) Where(query interface{}, args ...interface{}) *gorm.DB {
	return m.Called(query, args).Get(0).(*gorm.DB)
}

func (m *MockDB) FirstOrCreate(dest interface{}, conds ...interface{}) *gorm.DB {
	return m.Called(dest, conds).Get(0).(*gorm.DB)
}

func (m *MockDB) Save(value interface{}) *gorm.DB {
	return m.Called(value).Get(0).(*gorm.DB)
}

// Create a new in-memory database for testing
func newTestDB() *gorm.DB {
	db, err := gorm.Open(sqlite.Open(":memory:"), &gorm.Config{})
	if err != nil {
		panic("failed to connect database")
	}
	return db
}

// Initialize repository and perform setup for tests
func setup() (*gorm.DB, githubrepository.Repository) {
	db := newTestDB()
	logger := new(MockLogger)
	cfg := &config.Config{}

	// Auto-migrate schema
	db.AutoMigrate(&models.Repository{}, &models.Commit{})

	repoSvc := githubrepository.NewRepository(db, logger, cfg)
	return db, repoSvc
}

// Mock Logger
type MockLogger struct {
	mock.Mock
}

func (m *MockLogger) Infof(format string, args ...interface{}) {
	m.Called(format, args)
}
func (m *MockLogger) Errorf(format string, args ...interface{}) {
	m.Called(format, args)
}
func (m *MockLogger) Debugf(format string, args ...interface{}) {
	m.Called(format, args)
}
func (m *MockLogger) Error(args ...interface{}) {
	m.Called(args)
}
func (m *MockLogger) Info(args ...interface{}) {
	m.Called(args)
}
func (m *MockLogger) Debug(args ...interface{}) {
	m.Called(args)
}
func (m *MockLogger) With(ctx context.Context, args ...interface{}) log.Logger {
	m.Called(ctx, args)
	return log.Logger(m)
}

// Mock GitHub responses
func mockGitHubRepository() models.Repository {
	return models.Repository{
		Name:        "go-chat",
		FullName:    "omept/go-chat",
		Description: "Test repository",
		Language:    "Go",
		ForksCount:  10,
		StarsCount:  20,
		OpenIssues:  5,
		Watchers:    100,
		CreatedAt:   time.Now(),
		UpdatedAt:   time.Now(),
	}
}

func mockGitHubCommits() []githubrepository.GitHubCommit {
	return []githubrepository.GitHubCommit{
		{
			SHA: "abc123",
			Commit: struct {
				Message string `json:"message"`
				Author  struct {
					Name  string    `json:"name"`
					Email string    `json:"email"`
					Date  time.Time `json:"date"`
				} `json:"author"`
				Committer struct {
					Date string `json:"date"`
				} `json:"committer"`
			}{
				Message: "Initial commit",
				Author: struct {
					Name  string    `json:"name"`
					Email string    `json:"email"`
					Date  time.Time `json:"date"`
				}{
					Name:  "Author Name",
					Email: "author@example.com",
					Date:  time.Now(),
				},
				Committer: struct {
					Date string `json:"date"`
				}{
					Date: time.Now().Format(time.RFC3339),
				},
			},
			HTMLURL: "https://github.com/omept/go-chat/commit/abc123",
		},
	}
}

func TestFetchRepo(t *testing.T) {
	db, repoSvc := setup()

	// Setup test data
	testRepo := models.Repository{
		Name:        "omept/go-chat",
		FullName:    "omept/go-chat",
		Description: "Test repository",
	}
	db.Create(&testRepo)

	// Test FetchRepo
	repo, err := repoSvc.FetchRepo(context.Background(), "omept", "go-chat", 1, 10)
	assert.NoError(t, err)
	assert.Equal(t, testRepo.FullName, repo.FullName)
}

func TestSaveCommits(t *testing.T) {
	db, repoSvc := setup()

	// Mock GitHub commits
	commits := mockGitHubCommits()

	repo := mockGitHubRepository()
	db.FirstOrCreate(&repo)

	repoSvc.SaveCommits(commits, repo)

	// Check if commits were saved correctly
	var savedCommit models.Commit
	err := db.Where("sha = ?", commits[0].SHA).First(&savedCommit).Error
	assert.NoError(t, err)
	assert.Equal(t, commits[0].SHA, savedCommit.SHA)
}
