package entities

import "time"

type VehicleCollision struct {
	VehicleId   string    `json:"vehicle_id" gorm:"primaryKey"`
	CollisionId string    `json:"collision_id" gorm:"primaryKey"`
	CreatedAt   time.Time `json:"created_at"`
	UpdatedAt   time.Time `json:"updated_at"`
}

type VehicleCollisions []VehicleCollision
