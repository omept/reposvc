package main

import (
	"context"
	"flag"
	"fmt"
	"net/http"
	"os"
	"time"

	"github.com/gorilla/mux"
	"github.com/joho/godotenv"
	"github.com/omept/reposvc/internal/config"
	"github.com/omept/reposvc/internal/githubrepository"
	"github.com/omept/reposvc/internal/healthcheck"
	"github.com/omept/reposvc/internal/models"
	"github.com/omept/reposvc/pkg/log"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

// Version indicates the current version of the application.
var Version = "1.0.0"

var flagConfig = flag.String("config", "./config/local.yml", "path to the config file")

func main() {
	flag.Parse()
	// create root logger tagged with server version
	logger := log.New().With(context.TODO(), "version", Version)

	err := godotenv.Load()
	if err != nil {
		logger.Errorf("error loading .env file: %s", err)
		os.Exit(-1)
	}

	// load application configurations
	cfg, err := config.Load(*flagConfig, logger)
	if err != nil {
		logger.Errorf("failed to load application configuration: %s", err)
		os.Exit(-1)
	}

	// connect to the database
	dbHost := os.Getenv("DB_HOST")
	dbUser := os.Getenv("DB_USER")
	dbPassword := os.Getenv("DB_PASSWORD")
	dbName := os.Getenv("DB_NAME")
	dbPort := os.Getenv("DB_PORT")
	dsn := fmt.Sprintf("host=%s user=%s password=%s dbname=%s port=%s sslmode=disable", dbHost, dbUser, dbPassword, dbName, dbPort)
	db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		logger.Errorf("failed setting up db: ", err)
		os.Exit(-1)
	}
	db.AutoMigrate(&models.Commit{}, &models.Repository{})
	defer func() {
		sqlDB, err := db.DB()
		if err != nil {
			logger.Error(err)
			return
		}
		if err := sqlDB.Close(); err != nil {
			logger.Error(err)
		}
	}()

	// Build HTTP server
	address := fmt.Sprintf(":%v", cfg.ServerPort)
	hs := http.Server{
		Addr:    address,
		Handler: buildHandler(logger, db, cfg),
	}

	logger.Infof("server %v is running at %v", Version, address)
	if err := hs.ListenAndServe(); err != nil && err != http.ErrServerClosed {
		logger.Error(err)
		os.Exit(-1)
	}
}

// buildHandler sets up the HTTP routing and builds an HTTP handler.
func buildHandler(logger log.Logger, db *gorm.DB, cfg *config.Config) http.Handler {
	router := mux.NewRouter().StrictSlash(true)

	healthcheck.RegisterHandlers(router, Version)

	// Set up in-memmory repository channel used to monitor added repositories
	repoChan := make(chan githubrepository.GitRepo, 100)
	reposPool := make(map[string]githubrepository.GitRepo, 100)

	// add a repostory
	for {
		select {
		case newRepo := <-repoChan:
			reposPool[newRepo.Id] = newRepo

		}
	}

	// Set up API
	subrouter := router.PathPrefix("/api/v1").Subrouter()
	githubrepository.RegisterHandlers(subrouter,
		githubrepository.NewService(githubrepository.NewRepository(db, logger, cfg), logger),
		logger,
	)

	return router
}

func monitorRepository(db *sqlx.DB, client *github.Client, owner, repo string, interval time.Duration, since time.Time) {
	ticker := time.NewTicker(interval)
	defer ticker.Stop()

	for {
		select {
		case <-ticker.C:
			repository, err := fetchRepository(client, owner, repo)
			if err != nil {
				log.Println("Failed to fetch repository:", err)
				continue
			}

			repoID, err := saveRepository(db, repository)
			if err != nil {
				log.Println("Failed to save repository:", err)
				continue
			}

			commits, err := fetchCommits(client, owner, repo, since)
			if err != nil {
				log.Println("Failed to fetch commits:", err)
				continue
			}

			err = saveCommits(db, repoID, commits)
			if err != nil {
				log.Println("Failed to save commits:", err)
			}

			// Update since to the latest commit date
			if len(commits) > 0 {
				since = commits[0].GetCommit().GetAuthor().GetDate().Time
			}
		}
	}
}
