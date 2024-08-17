package gitrepository

import (
	"context"

	"github.com/go-playground/validator/v10"
	"github.com/omept/reposvc/internal/entities"
	"github.com/omept/reposvc/pkg/log"
)

// Service encapsulates usecase logic for gitrepository.
type Service interface {
	OwnerRepo(ctx context.Context, input RepoDetailsRequest) (GitRepo, error)
}

// GitRepo represents the data about a Git Repository.
type GitRepo struct {
	entities.GitRepo
}

// RepoDetailsRequest represents the request structure for getting a Github Repository.
type RepoDetailsRequest struct {
	Repo  string `json:"repo"`
	Owner string `json:"owner"`
}

// Validate validates the RepoDetailsRequest fields.
func (m RepoDetailsRequest) Validate() error {
	validate := validator.New()
	return validate.Struct(m)
}

type service struct {
	repo   Repository
	logger log.Logger
}

// NewService creates a new gitrepository service.
func NewService(repo Repository, logger log.Logger) Service {
	return service{repo, logger}
}

// ownerRepo returns the git repo specified.
func (s service) OwnerRepo(ctx context.Context, input RepoDetailsRequest) (GitRepo, error) {
	gitRepo, err := s.repo.OwnerRepo(ctx, input.Owner, input.Repo)
	if err != nil {
		return GitRepo{}, err
	}
	return GitRepo{gitRepo}, nil
}
