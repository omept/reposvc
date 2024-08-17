package vehiclecollision

import (
	"github.com/omept/reposvc/pkg/log"
	"gorm.io/gorm"
)

// Repository encapsulates the logic to access vehicle collisions from the data source.
type Repository interface {
	// Get returns the vehicle collision with the specified vehicleCollision ID.
	// Get(ctx context.Context, )

}

// repository persists vehicleCollisions in database
type repository struct {
	db     *gorm.DB
	logger log.Logger
}

// NewRepository creates a new vehicleCollision repository
func NewRepository(db *gorm.DB, logger log.Logger) Repository {
	return repository{db, logger}
}

// Get reads the vehicleCollision with the specified ID from the database.
// func (r repository) Get(ctx context.Context, vehicleId string, collisionId string) (entities.VehicleCollision, error) {
// 	var vehicleCollision entities.VehicleCollision
// 	result := r.db.WithContext(ctx).Where("vehicle_id = ? AND collision_id = ?", vehicleId, collisionId).First(&vehicleCollision)
// 	return vehicleCollision, result.Error
// }
