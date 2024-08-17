package config

import (
	"os"

	"github.com/omept/reposvc/pkg/log"
	"gopkg.in/yaml.v2"
)

const (
	defaultServerPort = 8088
)

// Config represents an application configuration.
type Config struct {
	// the server port. Defaults to 8088
	ServerPort int `yaml:"server_port" env:"SERVER_PORT"`
	// the data source name (DSN) for connecting to the database. required.
	DSN string `yaml:"dsn" env:"DSN,secret"`
}

// Load returns an application configuration which is populated from the given configuration file and environment variables.
func Load(file string, logger log.Logger) (*Config, error) {
	// default config
	c := Config{
		ServerPort: defaultServerPort,
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
