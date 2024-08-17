package entities

import "time"

type Collision struct {
	Id          string    `json:"id"`
	Latitude    float64   `json:"latitude"`
	Longitude   float64   `json:"longitude"`
	Severity    string    `json:"severity"`
	CollisionAt time.Time `json:"collision_at"`
	CreatedAt   time.Time `json:"created_at"`
	UpdatedAt   time.Time `json:"updated_at"`
}

type Collisions []Collision
