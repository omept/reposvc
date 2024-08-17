package config

import (
	"fmt"
	"os"
	"strconv"

	"github.com/omept/reposvc/pkg/log"
	"gopkg.in/yaml.v2"
)

// Config represents an application configuration.
type Config struct {
	// the server port. Defaults to 8088
	ServerPort int `yaml:"server_port" env:"SERVER_PORT"`
}

// Load returns an application configuration which is populated from the given configuration file and environment variables.
func Load(file string, logger log.Logger) (*Config, error) {
	// default config
	serverPort, err := strconv.Atoi(os.Getenv("SERVER_PORT"))
	if serverPort == 0 || err != nil {
		return nil, fmt.Errorf("invalid SERVER_PORT error %s", err)
	}

	c := Config{
		ServerPort: serverPort,
	}

	// load from YAML config file
	bytes, err := os.ReadFile(file)
	if err != nil {
		return nil, err
	}
	if err = yaml.Unmarshal(bytes, &c); err != nil {
		return nil, err
	}

	return &c, err
}
