package models

import (
	"time"

	"gorm.io/gorm"
)

type Repository struct {
	gorm.Model
	Name        string `gorm:"index"`
	FullName    string
	Description string
	URL         string
	Language    string
	ForksCount  int
	StarsCount  int
	OpenIssues  int
	Watchers    int
	CreatedAt   time.Time `gorm:"index"`
	UpdatedAt   time.Time `gorm:"index"`
	LastCommit  time.Time `gorm:"index"`
	Commits     []Commit
}
