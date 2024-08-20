package githubrepository

import (
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/gorilla/mux"
	"github.com/omept/reposvc/pkg/log"
)

// RegisterHandlers sets up the routing of the HTTP handlers.
func RegisterHandlers(r *mux.Router, service Service, logger log.Logger) {
	res := resource{service, logger}

	r.HandleFunc("/index-github-repository", res.IndexRepo).Methods("POST")
	r.HandleFunc("/fetch-github-repository", res.FetchRepo).Methods("GET")
	// r.HandleFunc("/git-repository/{owner}/truncate-commits-from/{repo}/{date}", res.truncateCommitsFrom).Methods("PUT")
}

type resource struct {
	service Service
	logger  log.Logger
}

const (
	defaultPage    = 1
	defaultPerPage = 10
)

type APIResponse struct {
	Message    string `json:"message"`
	StatusCode uint   `json:"status_code"`
	Data       any    `json:"data"`
	Error      any    `json:"error"`
}

func (r resource) IndexRepo(w http.ResponseWriter, req *http.Request) {
	var input RepoDetailsRequest
	var res APIResponse

	// Decode the JSON request body into the RepoDetailsRequest struct
	err := json.NewDecoder(req.Body).Decode(&input)
	if err != nil {
		w.Header().Set("Content-Type", "application/json")
		res = APIResponse{StatusCode: http.StatusBadRequest, Message: "Bad request", Error: err.Error()}
		json.NewEncoder(w).Encode(res)
		return
	}
	// Close the body when done to prevent memory leaks
	defer req.Body.Close()

	fmt.Println(input)
	err = Validate(input)
	if err != nil {
		w.Header().Set("Content-Type", "application/json")
		res = APIResponse{StatusCode: http.StatusBadRequest, Message: "Validation error", Error: err.Error()}
		json.NewEncoder(w).Encode(res)
		return
	}

	indexRes, err := r.service.IndexRepo(req.Context(), input)
	if err != nil {
		w.Header().Set("Content-Type", "application/json")
		res = APIResponse{StatusCode: http.StatusBadRequest, Message: "Indexing error", Error: err.Error()}
		json.NewEncoder(w).Encode(res)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	res = APIResponse{StatusCode: http.StatusOK, Message: indexRes.Message}
	json.NewEncoder(w).Encode(res)
}

func (r resource) FetchRepo(w http.ResponseWriter, req *http.Request) {
	var input FetchRepoRequest
	var res APIResponse

	// Decode the JSON request body into the FetchRepoRequest struct
	err := json.NewDecoder(req.Body).Decode(&input)
	if err != nil {
		w.Header().Set("Content-Type", "application/json")
		res = APIResponse{StatusCode: http.StatusBadRequest, Message: "Bad request", Error: err.Error()}
		json.NewEncoder(w).Encode(res)
		return
	}
	// Close the body when done to prevent memory leaks
	defer req.Body.Close()

	fmt.Println(input)

	err = Validate(input)
	if err != nil {
		w.Header().Set("Content-Type", "application/json")
		res = APIResponse{StatusCode: http.StatusBadRequest, Message: "Validation error", Error: err.Error()}
		json.NewEncoder(w).Encode(res)
		return
	}

	fetchRes, err := r.service.FetchRepo(req.Context(), input)

	if err != nil {
		w.Header().Set("Content-Type", "application/json")
		var message string
		code := uint(http.StatusBadRequest)
		switch err.Error() {
		case "record not found":
			message = err.Error()
			code = http.StatusOK
		default:
			message = "fetch error"

		}
		res = APIResponse{StatusCode: code, Message: message, Error: err.Error()}
		json.NewEncoder(w).Encode(res)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	res = APIResponse{StatusCode: http.StatusOK, Message: "Successful", Data: fetchRes}
	json.NewEncoder(w).Encode(res)
}
