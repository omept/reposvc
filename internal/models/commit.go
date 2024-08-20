package models

import (
	"time"

	"gorm.io/gorm"
)

type Commit struct {
	gorm.Model
	SHA          string `gorm:"uniqueIndex"`
	Message      string
	AuthorName   string
	AuthorEmail  string    `gorm:"index"`
	Date         time.Time `gorm:"index"`
	URL          string
	RepositoryID uint `gorm:"index"`
}
