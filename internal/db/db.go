package db

import (
	"fmt"
	"os"

	"github.com/omept/reposvc/internal/models"
	"github.com/omept/reposvc/pkg/log"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

func SetupDb(logger log.Logger) *gorm.DB {
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

	return db
}

func CloseDb(db *gorm.DB, logger log.Logger) {
	sqlDB, err := db.DB()
	if err != nil {
		logger.Error(err)
		return
	}
	if err := sqlDB.Close(); err != nil {
		logger.Error(err)
	}
}
