package githubrepository

import (
	"context"
	"encoding/json"
	"fmt"
	"net/http"
	"time"

	"github.com/omept/reposvc/internal/config"
	"github.com/omept/reposvc/internal/models"
	"github.com/omept/reposvc/pkg/log"
	"gorm.io/gorm"
)

// Repository encapsulates the logic to access github repositories from the data source.
type Repository interface {
	// IndexRepo begins the process of indexing a repository if the repository is valid
	IndexRepo(ctx context.Context, owner string, repo string) (models.Repository, error)
	// FetchRepo returns the repository, from database, belonging to owner.
	FetchRepo(ctx context.Context, owner string, repo string, page, perPage uint16) (models.Repository, error)
	// SaveCommits persists a repository's commits to database
	SaveCommits(commits []GitHubCommit, repo models.Repository)
	// TopCommitAuthors return top N commit authors by commit count
	TopCommitAuthors(ctx context.Context, limit uint16) ([]AuthorsCommitCount, error)
}

// repository implements the logic for the github repository service
type repository struct {
	db     *gorm.DB
	logger log.Logger
	cfg    *config.Config
}

// NewRepository creates a new repository and loads previous git repositories for monitoring
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
	r.logger.Infof("Monitoring commits for repository %s", gitrepo.FullName)
	for {
		commits, err := r.FetchCommits(gitrepo)
		if err != nil {
			r.logger.Infof("Error fetching commits for repository %s: %v", gitrepo.FullName, err.Error())
			time.Sleep(1 * time.Hour)
			continue
		}

		r.SaveCommits(commits, gitrepo)
		time.Sleep(1 * time.Hour)
		r.logger.Infof("Fetching commits for repository %s", gitrepo.FullName)
	}
}

// FetchRepo retrieves the repository details from database
func (r repository) FetchRepo(ctx context.Context, owner string, repo string, page, perPage uint16) (models.Repository, error) {
	var gitRepo models.Repository

	// Fetch the repository and paginate the commits
	err := r.db.Preload("Commits", func(db *gorm.DB) *gorm.DB {
		return db.Order("date desc").Offset((int(page) - 1) * int(perPage)).Limit(int(perPage))
	}).First(&gitRepo, "name = ?", fmt.Sprintf("%s/%s", owner, repo)).Error

	if err != nil {
		return gitRepo, err
	}

	return gitRepo, nil
}

// IndexRepo begins the process of indexing a github repository if the repository is valid
func (r repository) IndexRepo(ctx context.Context, owner string, repo string) (models.Repository, error) {
	// fetch repo from github and save
	repoName := fmt.Sprintf("%s/%s", owner, repo)
	repoModel, err := r.SaveRepository(r.db, repoName)
	if err != nil {
		return models.Repository{}, err
	}
	go func() {
		// fetch repo commits
		commits, err := r.FetchCommits(repoModel)
		if err != nil {
			r.logger.Infof("error on fetch commits for repo: %s. error: %s", repoModel.Name, err.Error())
			return
		}
		// save commits
		r.SaveCommits(commits, repoModel)
	}()
	return repoModel, nil
}

// SaveRepository gets and save a repository from github
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
		LastCommit:  ghRepo.CreatedAt,
	}

	err = db.Where(models.Repository{FullName: repo.FullName}).FirstOrCreate(&repo).Error
	if err != nil {
		return models.Repository{}, err
	}

	return repo, nil
}

// FetchRepository only gets a repository from github
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

// FetchCommits only gets a repository's commits from github
func (r repository) FetchCommits(repo models.Repository) ([]GitHubCommit, error) {
	url := fmt.Sprintf("https://api.github.com/repos/%s/commits?since=%s", repo.FullName, repo.LastCommit.Format(time.RFC3339))
	resp, err := http.Get(url)
	if err != nil {
		r.logger.Infof("Error fetching commits for repository %s: %v", repo.FullName, err.Error())
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

// SaveCommits persists a repository's commits to database
func (r repository) SaveCommits(commits []GitHubCommit, repo models.Repository) {
	if len(commits) == 0 {
		return
	}

	// Update the date of the latest commit (first in the list)
	r.updateRepositoryLastCommitDate(&repo, commits[0].Commit.Committer.Date)

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

// updateRepositoryLastCommitDate saves the last commit date of a repository model to the database
func (r repository) updateRepositoryLastCommitDate(repo *models.Repository, date string) {
	lastCommitDate, err := time.Parse(time.RFC3339, date)
	if err != nil {
		r.logger.Infof("failed to parse last commit date: %v", err.Error())
	}
	repo.LastCommit = lastCommitDate
	if err := r.db.Save(repo).Error; err != nil {
		r.logger.Infof("failed to update repository: %v", err.Error())
	}
}

func (r repository) TopCommitAuthors(ctx context.Context, limit uint16) ([]AuthorsCommitCount, error) {
	var results []AuthorsCommitCount

	err := r.db.Model(&models.Commit{}).
		Select("author_name AS name, author_email AS email, COUNT(*) AS commit_counts").
		Group("name, email").
		Order("commit_counts DESC").
		Limit(int(limit)).
		Find(&results).Error

	if err != nil {
		return nil, err
	}

	return results, nil
}
