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
}

type GitHubCommit struct {
	SHA    string `json:"sha"`
	Commit struct {
		Message string `json:"message"`
		Author  struct {
			Name  string    `json:"name"`
			Email string    `json:"email"`
			Date  time.Time `json:"date"`
		} `json:"author"`
	} `json:"commit"`
	HTMLURL string `json:"html_url"`
}

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
	Repo  string `json:"repo"`
	Owner string `json:"owner"`
}

// FetchRepoRequest represents the request structure for fetchin a Github Repository from data store
type FetchRepoRequest struct {
	Repo         string `json:"repo"`
	Owner        string `json:"owner"`
	CommitFilter RepoCommitFilter
}

// RepoCommitFilter defines the filter structure for FetchRepoRequest
type RepoCommitFilter struct {
	PerPage uint16 `json:"per_page"`
	Page    uint16 `json:"page"`
}

// Validate validates the RepoDetailsRequest or FetchRepoRequest fields.
func Validate[T FetchRepoRequest | RepoDetailsRequest](s T) error {
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
		for {
			select {
			case newRepo := <-repoChan:
				reposPool[newRepo.Name] = newRepo
			}
		}
	}()

	return service{repo, logger, repoChan, reposPool}
}

// FetchRepo returns the git repo specified.
func (s service) FetchRepo(ctx context.Context, input FetchRepoRequest) (models.Repository, error) {
	err := Validate(input)
	if err != nil {
		return models.Repository{}, err
	}

	gitRepo, err := s.repo.FetchRepo(ctx, input.Owner, input.Repo, input.CommitFilter.Page, input.CommitFilter.PerPage)
	if err != nil {
		return models.Repository{}, err
	}
	return gitRepo, nil
}

// IndexRepo indexes a github repository. i.e it loads and persists the github repo and its commits.
func (s service) IndexRepo(ctx context.Context, input RepoDetailsRequest) (IndexRepoResponse, error) {
	repoRes, err := s.repo.IndexRepo(ctx, input.Owner, input.Repo)
	if err != nil {
		return IndexRepoResponse{}, err
	}
	s.repoChan <- repoRes
	return IndexRepoResponse{Message: fmt.Sprintf("successfully indexing repo %s", repoRes.URL)}, nil
}
