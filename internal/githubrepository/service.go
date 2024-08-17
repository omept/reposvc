package githubrepository

import (
	"context"

	"github.com/go-playground/validator/v10"
	"github.com/omept/reposvc/internal/entities"
	"github.com/omept/reposvc/pkg/log"
)

// Service encapsulates usecase logic for githubrepository.
type Service interface {
	// FetchRepo returns the git repo specified.
	FetchRepo(ctx context.Context, input FetchRepoRequest) (GitRepo, error)
	// IndexRepo indexes a github repository. i.e it loads and persists the github repo and its commits.
	IndexRepo(ctx context.Context, input RepoDetailsRequest) (IndexRepoResponse, error)
}

// GitRepo represents the data about a Git Repository.
type GitRepo struct {
	entities.GitRepo
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
	repo   Repository
	logger log.Logger
}

// NewService creates a new gitrepository service.
func NewService(repo Repository, logger log.Logger) Service {
	return service{repo, logger}
}

// FetchRepo returns the git repo specified.
func (s service) FetchRepo(ctx context.Context, input FetchRepoRequest) (GitRepo, error) {
	err := Validate(input)
	if err != nil {
		return GitRepo{}, err
	}

	gitRepo, err := s.repo.FetchRepo(ctx, input.Owner, input.Repo, input.CommitFilter.Page, input.CommitFilter.PerPage)
	if err != nil {
		return GitRepo{}, err
	}
	return GitRepo{gitRepo}, nil
}

// IndexRepo indexes a github repository. i.e it loads and persists the github repo and its commits.
func (s service) IndexRepo(ctx context.Context, input RepoDetailsRequest) (IndexRepoResponse, error) {
	indexRepoRes, err := s.repo.IndexRepo(ctx, input.Owner, input.Repo)
	if err != nil {
		return IndexRepoResponse{}, err
	}
	return indexRepoRes, nil
}
