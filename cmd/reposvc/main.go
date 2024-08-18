package main

import (
	"context"
	"flag"
	"fmt"
	"net/http"
	"os"

	"github.com/gorilla/mux"
	"github.com/joho/godotenv"
	"github.com/omept/reposvc/internal/config"
	"github.com/omept/reposvc/internal/db"
	"github.com/omept/reposvc/internal/githubrepository"
	"github.com/omept/reposvc/internal/healthcheck"
	"github.com/omept/reposvc/pkg/log"
	"gorm.io/gorm"
)

// Version indicates the current version of the application.
var Version = "1.0.0"

var flagConfig = flag.String("config", "./config/local.yml", "path to the config file")

func main() {
	flag.Parse()
	// create root logger tagged with app version
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

	// setup database
	dbInstance := db.SetupDb(logger)
	defer db.CloseDb(dbInstance, logger)

	// setup HTTP server
	address := fmt.Sprintf(":%v", cfg.ServerPort)
	hs := http.Server{
		Addr:    address,
		Handler: buildHandler(logger, dbInstance, cfg),
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
	// healthcheck route
	healthcheck.RegisterHandlers(router, Version)
	// Set up API
	subrouter := router.PathPrefix("/api/v1").Subrouter()
	githubrepository.RegisterHandlers(subrouter,
		githubrepository.NewService(githubrepository.NewRepository(db, logger, cfg), logger),
		logger,
	)
	return router
}
