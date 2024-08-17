package vehiclecollision

import (
	"github.com/omept/reposvc/pkg/log"
)

// Service encapsulates usecase logic for albums.
type Service interface {
	// Get(ctx context.Context, input CRUDVehicleCollisionRequest) (VehicleCollision, error)
}

// // VehicleCollision represents the data about a VehicleCollision.
// type VehicleCollision struct {
// 	entities.VehicleCollision
// }

// CRUDVehicleCollisionRequest represents a vehicleCollision create, read, update, or delete request.
// type CRUDVehicleCollisionRequest struct {
// 	VehicleId   string `json:"vehicle_id"`
// 	CollisionId string `json:"collision_id"`
// }

// // Validate validates the CRUDVehicleCollisionRequest fields.
// func (m CRUDVehicleCollisionRequest) Validate() error {
// 	validate := validator.New()
// 	return validate.Struct(m)
// }

type service struct {
	repo   Repository
	logger log.Logger
}

// NewService creates a new album service.
func NewService(repo Repository, logger log.Logger) Service {
	return service{repo, logger}
}

// Get returns the album with the specified the album ID.
// func (s service) Get(ctx context.Context, input CRUDVehicleCollisionRequest) (VehicleCollision, error) {
// 	vehicleCollision, err := s.repo.Get(ctx, input.VehicleId, input.CollisionId)
// 	if err != nil {
// 		return VehicleCollision{}, err
// 	}
// 	return VehicleCollision{vehicleCollision}, nil
// }
