package gitrepository

import (
	"context"

	"github.com/omept/reposvc/internal/config"
	"github.com/omept/reposvc/internal/entities"
	"github.com/omept/reposvc/pkg/log"
	"gorm.io/gorm"
)

// Repository encapsulates the logic to access github repositories from the data source.
type Repository interface {
	// OwnerRepo returns the repository belonging to owner.
	OwnerRepo(ctx context.Context, owner string, repo string) (entities.GitRepo, error)
}

// repository retrives owner repos in database or from github
type repository struct {
	db     *gorm.DB
	logger log.Logger
	cfg    *config.Config
}

// NewRepository creates a new gitRepository repository
func NewRepository(db *gorm.DB, logger log.Logger, cfg *config.Config) Repository {
	return repository{db, logger, cfg}
}

// OwnerRepo retrieves the git repo from database, it gets is from github if not available in database.
func (r repository) OwnerRepo(ctx context.Context, owner string, repo string) (entities.GitRepo, error) {
	var gitRepo entities.GitRepo = entities.GitRepo{}
	return gitRepo, nil
}
