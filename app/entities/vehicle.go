package entities

import "time"

type Vehicle struct {
	Id        string    `json:"id"`
	Make      string    `json:"make"`
	Model     string    `json:"model"`
	Year      int16     `json:"year"`
	Color     string    `json:"color"`
	VinNumber string    `json:"vinNumber"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type Vehicles []Vehicle
