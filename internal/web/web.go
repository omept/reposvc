package healthcheck

import (
	"fmt"
	"net/http"

	"github.com/gorilla/mux"
)

// RegisterHandlers registers the handlers that perform healthchecks.
func RegisterHandlers(r *mux.Router, version string) {
	r.F
	r.HandleFunc("/", healthcheck(version))
}

func healthcheck(version string) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "OK "+version)
	}
}
