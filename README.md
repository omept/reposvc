
# GitHub API Data Fetching Service

This repository contains a Golang service that interacts with GitHub's public APIs to fetch and store repository information and commit history. The service also includes functionality to monitor repositories for changes and keep the stored data in sync with GitHub.

## Objective

Build a service that:

- Fetches repository and commit data from GitHub.
- Stores the data in a persistent database.
- Continuously monitors the repository for changes and updates the stored data.
- Provides efficient querying mechanisms to retrieve and analyze the stored data.

## Features

1. **GitHub API Data Fetching**:
    - Retrieve commits, including commit messages, author details, dates, and URLs.
    - Store fetched commit data in a database (e.g., PostgreSQL).
    - Avoid duplicate entries by ensuring that commits in the database mirror those on GitHub.
    - Allow configuration of a start date to pull commits from a specific point in time.
    - Implement a mechanism to reset the collection and restart fetching from a specified date.

2. **Repository Metadata Storage**:
    - Maintain an auxiliary table for repository metadata, including:
        - Name, description, URL, language
        - Forks count, stars count, open issues count, watchers count
        - Created and updated dates

3. **Data Storage**:
    - Design and create tables to store repository details and commit data.
    - Ensure efficient querying and retrieval of data from the database.

4. **Continuous Monitoring**:
    - Monitor the repository at regular intervals (e.g., every hour) for new commits.
    - Ensure that only new commits are fetched and stored.

5. **Querying and Data Retrieval**:
    - Retrieve the top N commit authors by commit counts.
    - Fetch commits by repository name.

## Project Structure

```plaintext
.
├── cmd
│   └── main.go           # Entry point for the service
├── internal
│   ├── github            # GitHub API interaction logic
│   ├── db                # Database models and interactions
│   ├── service           # Core business logic
│   └── tests             # Unit tests for core functions
├── config
│   └── config.go         # Configuration settings (e.g., API keys, DB connection)
├── migrations
│   └── *.sql             # Database migration scripts
├── scripts
│   └── seed_data.go      # Script to seed the database with initial data
├── Dockerfile            # Dockerfile to containerize the application
├── docker-compose.yml    # Docker Compose for multi-container setup
└── README.md             # This file
```

## Getting Started

### Prerequisites

- [Go](https://golang.org/doc/install) (version 1.18+)
- [PostgreSQL](https://www.postgresql.org/download/)
- [Docker](https://www.docker.com/products/docker-desktop) (for containerized deployment)

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/yourusername/github-api-fetcher.git
    cd github-api-fetcher
    ```

2. Set up the environment variables by creating a `.env` file based on `.env.example`.

3. Run the database migrations:

    ```bash
    go run scripts/migrate.go
    ```

4. Seed the database (optional):

    ```bash
    go run scripts/seed_data.go
    ```

5. Build and run the service:

    ```bash
    go build -o github-api-fetcher ./cmd
    ./github-api-fetcher
    ```

Alternatively, you can use Docker:

```bash
docker-compose up --build
```

### Configuration

All configuration settings (e.g., API keys, database connections) are managed through environment variables defined in the `.env` file.

### Usage

- **Fetch and store repository and commit data:**

    The service automatically fetches and stores data for the specified repositories based on the configuration. The data is stored in a PostgreSQL database.

- **Monitor repository for changes:**

    The service continuously monitors the repository and updates the database with new commits as they appear on GitHub.

- **Querying data:**

    Example queries include retrieving the top N commit authors and fetching commits by repository name. These can be executed via the provided API or CLI commands.

### Example Queries

- **Get the top N commit authors by commit counts:**

    ```sql
    SELECT author_name, COUNT(*) AS commit_count
    FROM commits
    GROUP BY author_name
    ORDER BY commit_count DESC
    LIMIT N;
    ```

- **Retrieve commits of a repository by name:**

    ```sql
    SELECT * 
    FROM commits 
    WHERE repository_id = (SELECT id FROM repositories WHERE name = 'your-repo-name');
    ```

### Unit Tests

The project includes unit tests for core functionalities, located in the `internal/tests` directory. To run the tests:

```bash
go test ./internal/tests/...
```

### Deployment

For deployment, the service can be containerized using Docker. Use the provided `Dockerfile` and `docker-compose.yml` for easy setup.

### Performance Considerations

- **Efficient data storage**: Indexed fields and optimized queries ensure fast retrieval of commit data.
- **Scalability**: The service is designed to handle large datasets and can be scaled horizontally with multiple instances.

### Error Handling

The service includes robust error handling with clear and meaningful error messages. All critical operations are monitored and logged.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

## Resources

- [GitHub REST API Documentation](https://docs.github.com/en/rest)

---