package gitrepository

import (
	"encoding/json"
	"net/http"

	"github.com/gorilla/mux"
	"github.com/omept/reposvc/pkg/log"
)

// RegisterHandlers sets up the routing of the HTTP handlers.
func RegisterHandlers(r *mux.Router, service Service, logger log.Logger) {
	res := resource{service, logger}

	r.HandleFunc("/git-repository/{owner}/{repo}", res.ownerRepo).Methods("GET")
	// r.HandleFunc("/git-repository/{owner}/truncate-commits-from/{repo}/{date}", res.truncateCommitsFrom).Methods("PUT")
}

type resource struct {
	service Service
	logger  log.Logger
}

func (r resource) ownerRepo(w http.ResponseWriter, req *http.Request) {
	var input RepoDetailsRequest
	params := mux.Vars(req)
	input.Owner = params["owner"]
	input.Repo = params["repo"]
	gitRepo, err := r.service.OwnerRepo(req.Context(), input)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte("500 - " + err.Error()))
		return
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(gitRepo)
}
