package main

import (
	"context"
	"fmt"
	"os"

	"github.com/joho/godotenv"
	"github.com/omept/reposvc/internal/db"
	"github.com/omept/reposvc/pkg/log"
	"gorm.io/gorm"
)

func SeedDatabase(db *gorm.DB) error {
	filePath := "scripts/seed.sql"
	// Read the SQL file
	sqlBytes, err := os.ReadFile(filePath)
	if err != nil {
		return fmt.Errorf("failed to read SQL file: %v", err)
	}
	sqlContent := string(sqlBytes)

	// Execute the SQL commands
	if err := db.Exec(sqlContent).Error; err != nil {
		return fmt.Errorf("failed to execute SQL commands: %v", err)
	}

	return nil
}

func main() {
	// setup database
	// create root logger tagged with app version
	logger := log.New().With(context.TODO(), "version", "1.0.0")

	err := godotenv.Load()
	if err != nil {
		logger.Errorf("error loading .env file: %s", err)
		os.Exit(-1)
	}
	dbInstance := db.SetupDb(logger)
	defer db.CloseDb(dbInstance, logger)

	//  seeding the database
	err = SeedDatabase(dbInstance)
	if err != nil {
		logger.Infof("failed to seed database: %v", err)
		return
	}

	fmt.Println("Database seeded successfully")
}
