package models

import (
	"time"

	"gorm.io/gorm"
)

type Repository struct {
	gorm.Model
	Name        string
	FullName    string
	Description string
	URL         string
	Language    string
	ForksCount  int
	StarsCount  int
	OpenIssues  int
	Watchers    int
	CreatedAt   time.Time
	UpdatedAt   time.Time
	LastCommit  time.Time
	Commits     []Commit
}
