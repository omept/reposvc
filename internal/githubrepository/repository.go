package githubrepository

import (
	"context"
	"encoding/json"
	"fmt"
	"net/http"
	"time"

	"github.com/omept/reposvc/internal/config"
	"github.com/omept/reposvc/internal/entities"
	"github.com/omept/reposvc/internal/models"
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
	instance := repository{db, logger, cfg}
	gitrepos := FetchAllRepositories(db)

	for _, gitrepo := range gitrepos {
		go MonitorRepository(instance, gitrepo)
	}
	return instance
}

func FetchAllRepositories(db *gorm.DB) []models.Repository {
	var repos []models.Repository
	db.Find(&repos)
	return repos
}

func MonitorRepository(r repository, gitrepo models.Repository) {
	for {
		commits, err := r.FetchCommits(gitrepo)
		if err != nil {
			r.logger.Infof("Error fetching commits for repository %s: %v", gitrepo.Name, err)
			time.Sleep(1 * time.Hour)
			continue
		}

		r.SaveCommits(commits, gitrepo)
		time.Sleep(1 * time.Hour)
	}
}

// FetchRepo retrieves the repository details from database
func (r repository) FetchRepo(ctx context.Context, owner string, repo string, page, perPage uint16) (entities.GitRepo, error) {
	var gitRepo entities.GitRepo = entities.GitRepo{}
	return gitRepo, nil
}

// IndexRepo begins the process of indexing a github repository if the repository is valid
func (r repository) IndexRepo(ctx context.Context, owner string, repo string) (IndexRepoResponse, error) {
	// fetch repo from github

	// fetch commits

	// save commits

	// monitor commits

	res := IndexRepoResponse{}
	return res, nil
}

func (r repository) FetchRepository(repoName string) (GitHubRepository, error) {
	url := fmt.Sprintf("https://api.github.com/repos/%s", repoName)
	resp, err := http.Get(url)
	if err != nil {
		return GitHubRepository{}, err
	}
	defer resp.Body.Close()

	var repo GitHubRepository
	err = json.NewDecoder(resp.Body).Decode(&repo)
	if err != nil {
		return GitHubRepository{}, err
	}

	return repo, nil
}

func (r repository) SaveRepository(db *gorm.DB, repoName string) (models.Repository, error) {
	ghRepo, err := r.FetchRepository(repoName)
	if err != nil {
		return models.Repository{}, err
	}

	repo := models.Repository{
		Name:        ghRepo.Name,
		FullName:    ghRepo.FullName,
		Description: ghRepo.Description,
		URL:         ghRepo.HTMLURL,
		Language:    ghRepo.Language,
		ForksCount:  ghRepo.ForksCount,
		StarsCount:  ghRepo.StarsCount,
		OpenIssues:  ghRepo.OpenIssues,
		Watchers:    ghRepo.Watchers,
		CreatedAt:   ghRepo.CreatedAt,
		UpdatedAt:   ghRepo.UpdatedAt,
	}

	err = db.Where(models.Repository{Name: repo.Name}).FirstOrCreate(&repo).Error
	if err != nil {
		return models.Repository{}, err
	}

	return repo, nil
}

func (r repository) FetchCommits(repo models.Repository) ([]GitHubCommit, error) {
	url := fmt.Sprintf("https://api.github.com/repos/%s/commits?since=%s", repo.Name, repo.LastCommit.Format(time.RFC3339))
	resp, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()

	var commits []GitHubCommit
	err = json.NewDecoder(resp.Body).Decode(&commits)
	if err != nil {
		return nil, err
	}
	return commits, nil
}

func (r repository) SaveCommits(commits []GitHubCommit, repo models.Repository) {
	for _, c := range commits {
		var commit models.Commit
		r.db.Where(models.Commit{SHA: c.SHA}).FirstOrCreate(&commit, models.Commit{
			SHA:          c.SHA,
			Message:      c.Commit.Message,
			AuthorName:   c.Commit.Author.Name,
			AuthorEmail:  c.Commit.Author.Email,
			Date:         c.Commit.Author.Date,
			URL:          c.HTMLURL,
			RepositoryID: repo.ID,
		})

		if commit.Date.After(repo.LastCommit) {
			repo.LastCommit = commit.Date
		}
	}
	r.db.Save(&repo)
}
