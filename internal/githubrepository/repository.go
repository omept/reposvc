package githubrepository

import (
	"context"

	"github.com/omept/reposvc/internal/config"
	"github.com/omept/reposvc/internal/entities"
	"github.com/omept/reposvc/pkg/log"
	"gorm.io/gorm"
)

// Repository encapsulates the logic to access github repositories from the data source.
type Repository interface {
	// IndexRepo begins the process of indexing a repository if the repository is valid
	IndexRepo(ctx context.Context, owner string, repo string) (IndexRepoResponse, error)
	// FetchRepo returns the repository belonging to owner.
	FetchRepo(ctx context.Context, owner string, repo string, page, perPage uint16) (entities.GitRepo, error)
}

// repository implements the logic for the github repository service
type repository struct {
	db     *gorm.DB
	logger log.Logger
	cfg    *config.Config
}

// NewRepository creates a new repository
func NewRepository(db *gorm.DB, logger log.Logger, cfg *config.Config) Repository {
	return repository{db, logger, cfg}
}

// FetchRepo retrieves the repository details from database
func (r repository) FetchRepo(ctx context.Context, owner string, repo string, page, perPage uint16) (entities.GitRepo, error) {
	var gitRepo entities.GitRepo = entities.GitRepo{}
	return gitRepo, nil
}

// IndexRepo begins the process of indexing a github repository if the repository is valid
func (r repository) IndexRepo(ctx context.Context, owner string, repo string) (IndexRepoResponse, error) {
	res := IndexRepoResponse{}
	return res, nil
}
