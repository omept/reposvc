package githubrepository

import (
	"context"
	"fmt"
	"time"

	"github.com/go-playground/validator/v10"
	"github.com/omept/reposvc/internal/models"
	"github.com/omept/reposvc/pkg/log"
)

// Service encapsulates usecase logic for githubrepository.
type Service interface {
	// FetchRepo returns the git repo specified.
	FetchRepo(ctx context.Context, input FetchRepoRequest) (models.Repository, error)
	// IndexRepo indexes a github repository. i.e it loads and persists the github repo and its commits.
	IndexRepo(ctx context.Context, input RepoDetailsRequest) (IndexRepoResponse, error)
	// TopCommitAuthors return top N commit authors by commit count
	TopCommitAuthors(ctx context.Context, input TopCommitAuthorsRequest) (TopCommitAuthorsResponse, error)
	// TruncateCommitsFrom deletes commits from a specific date
	TruncateCommitsFrom(ctx context.Context, input TruncateCommitsFromRequest) error
}

// Github Repository Commits response
type GitHubCommit struct {
	SHA    string `json:"sha"`
	Commit struct {
		Message string `json:"message"`
		Author  struct {
			Name  string    `json:"name"`
			Email string    `json:"email"`
			Date  time.Time `json:"date"`
		} `json:"author"`
		Committer struct {
			Date string `json:"date"`
		} `json:"committer"`
	} `json:"commit"`
	HTMLURL string `json:"html_url"`
}

// Github Repository response
type GitHubRepository struct {
	Name        string    `json:"name"`
	FullName    string    `json:"full_name"`
	Description string    `json:"description"`
	HTMLURL     string    `json:"html_url"`
	Language    string    `json:"language"`
	ForksCount  int       `json:"forks_count"`
	StarsCount  int       `json:"stargazers_count"`
	OpenIssues  int       `json:"open_issues_count"`
	Watchers    int       `json:"watchers_count"`
	CreatedAt   time.Time `json:"created_at"`
	UpdatedAt   time.Time `json:"updated_at"`
}

// IndexRepoResponse represents the response sent for a request
type IndexRepoResponse struct {
	Message string `json:"message"`
}

// RepoDetailsRequest represents the request structure for getting a Github Repository.
type RepoDetailsRequest struct {
	Repo  string `json:"repo" validate:"required"`
	Owner string `json:"owner" validate:"required"`
}

// FetchRepoRequest represents the request structure for fetchin a Github Repository from data store
type FetchRepoRequest struct {
	Repo         string `json:"repo" validate:"required"`
	Owner        string `json:"owner" validate:"required"`
	CommitFilter RepoCommitFilter
}

// RepoCommitFilter defines the filter structure for FetchRepoRequest
type RepoCommitFilter struct {
	PerPage uint16 `json:"per_page"`
	Page    uint16 `json:"page"`
}

// TopCommitAuthorsRequest represents the request structure for fetchin top authors by commit count from data store
type TopCommitAuthorsRequest struct {
	Limit uint16 `json:"limit"`
}

// TruncateCommitsFromRequest represents the request structure for deleting commits after a date
type TruncateCommitsFromRequest struct {
	RepoDetailsRequest
	Date string `json:"date"  validate:"required"`
}

type TopCommitAuthorsResponse = []AuthorsCommitCount
type AuthorsCommitCount struct {
	Name         string `json:"name"`
	Email        string `json:"email"`
	CommitCounts string `json:"commit_counts"`
}

// Validate validates the RepoDetailsRequest or FetchRepoRequest fields.
func Validate[T FetchRepoRequest | RepoDetailsRequest | TopCommitAuthorsRequest | TruncateCommitsFromRequest](s T) error {
	validate := validator.New()
	return validate.Struct(s)
}

type service struct {
	repo      Repository
	logger    log.Logger
	repoChan  chan models.Repository
	reposPool map[string]models.Repository
}

// NewService creates a new gitrepository service.
func NewService(repo Repository, logger log.Logger) Service {
	// Set up in-memmory channel and pool used to monitor added repositories
	repoChan := make(chan models.Repository, 100)
	reposPool := make(map[string]models.Repository, 100)
	go func() {
		for newRepo := range repoChan {
			reposPool[newRepo.FullName] = newRepo
		}
	}()

	return service{repo, logger, repoChan, reposPool}
}

// FetchRepo returns the git repo specified.
func (s service) FetchRepo(ctx context.Context, input FetchRepoRequest) (models.Repository, error) {
	gitRepo, err := s.repo.FetchRepo(ctx, input.Owner, input.Repo, input.CommitFilter.Page, input.CommitFilter.PerPage)
	if err != nil {
		return models.Repository{}, err
	}
	return gitRepo, nil
}

// IndexRepo indexes a github repository. i.e it loads and persists the github repo and its commits.
func (s service) IndexRepo(ctx context.Context, input RepoDetailsRequest) (IndexRepoResponse, error) {
	repoName := fmt.Sprintf("%s/%s", input.Owner, input.Repo)
	if _, ok := s.reposPool[repoName]; ok {
		return IndexRepoResponse{Message: fmt.Sprintf("Duplicate request. Indexing of github repository %s has been previously requested.", repoName)}, nil
	}

	repoRes, err := s.repo.IndexRepo(ctx, input.Owner, input.Repo)
	if err != nil {
		return IndexRepoResponse{}, err
	}

	s.repoChan <- repoRes
	return IndexRepoResponse{Message: fmt.Sprintf("successfully indexing repo %s", repoRes.FullName)}, nil
}

// TopCommitAuthors return top N commit authors by commit count
func (s service) TopCommitAuthors(ctx context.Context, input TopCommitAuthorsRequest) (TopCommitAuthorsResponse, error) {
	topAuthors, err := s.repo.TopCommitAuthors(ctx, input.Limit)
	if err != nil {
		return nil, err
	}
	return topAuthors, nil
}

// TruncateCommitsFrom deletes commits from a specific date
func (s service) TruncateCommitsFrom(ctx context.Context, input TruncateCommitsFromRequest) error {
	err := s.repo.TruncateCommitsFrom(ctx, input.Owner, input.Repo, input.Date)
	if err != nil {
		return err
	}
	return nil
}
