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
	AuthorEmail  string
	Date         time.Time
	URL          string
	RepositoryID uint
}
