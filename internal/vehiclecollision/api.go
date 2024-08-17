package vehiclecollision

import (
	"encoding/json"
	"net/http"

	"github.com/gorilla/mux"
	"github.com/omept/reposvc/pkg/log"
)

// RegisterHandlers sets up the routing of the HTTP handlers.
func RegisterHandlers(r *mux.Router, service Service, logger log.Logger) {
	res := resource{service, logger}

	r.HandleFunc("/vehicle-collisions/v/{vehicleId}/c/{collisionId}", res.get).Methods("GET")
	r.HandleFunc("/vehicle-collisions", res.query).Methods("GET")

	// the following endpoints require a valid JWT
	r.HandleFunc("/vehicle-collisions", res.create).Methods("POST")
	r.HandleFunc("/vehicle-collisions/v/{vehicleId}/c/{collisionId}", res.update).Methods("PUT")
	r.HandleFunc("/vehicle-collisions/v/{vehicleId}/c/{collisionId}", res.delete).Methods("DELETE")
}

type resource struct {
	service Service
	logger  log.Logger
}

func (r resource) get(w http.ResponseWriter, req *http.Request) {
	var input CRUDVehicleCollisionRequest
	params := mux.Vars(req)
	input.VehicleId = params["vehicleId"]
	input.CollisionId = params["collisionId"]
	vehicleCollision, err := r.service.Get(req.Context(), input)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte("500 - " + err.Error()))
		return
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(vehicleCollision)
}

func (r resource) query(w http.ResponseWriter, req *http.Request) {
	ctx := req.Context()
	vehicleCollisions, err := r.service.Query(ctx)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte("500 - " + err.Error()))
		return
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(vehicleCollisions)
}

func (r resource) create(w http.ResponseWriter, req *http.Request) {
	var input CRUDVehicleCollisionRequest
	if err := json.NewDecoder(req.Body).Decode(&input); err != nil {
		r.logger.With(req.Context()).Info(err)
		w.WriteHeader(http.StatusBadRequest)
		w.Write([]byte("400 - Create VehicleCollision Invalid"))
		return
	}
	vehicleCollision, err := r.service.Create(req.Context(), input)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte("500 - " + err.Error()))
		return
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(vehicleCollision)
}

func (r resource) update(w http.ResponseWriter, req *http.Request) {
	var request CRUDVehicleCollisionRequest
	params := mux.Vars(req)
	request.VehicleId = params["vehicleId"]
	request.CollisionId = params["collisionId"]
	var input CRUDVehicleCollisionRequest
	if err := json.NewDecoder(req.Body).Decode(&input); err != nil {
		r.logger.With(req.Context()).Info(err)
		w.WriteHeader(http.StatusBadRequest)
		w.Write([]byte("400 - Updated VehicleCollision Invalid"))
		return
	}
	vehicleCollision, err := r.service.Update(req.Context(), request, input)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte("500 - " + err.Error()))
		return
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(vehicleCollision)
}

func (r resource) delete(w http.ResponseWriter, req *http.Request) {
	var input CRUDVehicleCollisionRequest
	params := mux.Vars(req)
	input.VehicleId = params["vehicleId"]
	input.CollisionId = params["collisionId"]
	vehicleCollision, err := r.service.Delete(req.Context(), input)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte("500 - " + err.Error()))
		return
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(vehicleCollision)
}
