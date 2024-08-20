
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
│   └── reposvc           # Entry point for the service
│       |── main.go 
│       └── Dockerfile   # Dockerfile to containerize the application
├── config
│   └── local.yml         # Configuration settings
├── internal
│   ├── config            # App configuration logic
│   ├── healtcheck        # API healthcheck logic
│   ├── githubrepository  # GitHub API interaction logic
│   ├── db                # Database models and interactions
│   ├── service           # Core business logic
│   └── tests             # Unit tests for core functions
├── pkg
│   └── log               # Log logic for the application
├── scripts
│   └── *.sql             # Database migration scripts
│   └── seed_data.go      # Script to seed the database with initial data
├── docker-compose.yml    # Docker Compose for multi-container setup
|── Makefile              # Makefile
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
    git clone https://github.com/omept/reposvc.git
    cd reposvc
    ```

2. Set up the environment variables by creating a `.env` file based on `.env.example`.

3. Seed the database (optional):

    ```bash
    go run scripts/seed_data.go
    ```

4. Build and run the service:

    ```bash
    go build -o github-repo-indexer ./cmd/reposvc
    ./github-repo-indexer
    ```

Alternatively, you can use Docker:

```bash
docker-compose up --build
```

### Configuration

All configuration settings (e.g. database connections) are managed through environment variables defined in the `.env` file.

### Usage

- **Fetch and store repository and commit data:**

    The service automatically fetches and stores data for the specified repositories based on the configuration. The data is stored in a PostgreSQL database.

- **Monitor repository for changes:**

    The service continuously monitors the repository and updates the database with new commits as they appear on GitHub.


### Example Queries

- **Get the top N commit authors by commit counts:**

    ```sql
    SELECT author_name, COUNT(*) AS commit_count
    FROM commits
    GROUP BY author_name
    ORDER BY commit_count DESC
    LIMIT N;
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


## API Documentation

### Index A Github Repository

#### Endpoint

**`POST /api/v1/index-github-repository`**

#### Description

Index repository gets repository details and commit history from GitHub based on the specified repository name and owner, then saves it locally. The repository is also monitored for future commits

#### Request Body

The request body should be a JSON object with the following structure:

```json
{
  "repo": "string",
  "owner": "string"
}
```

#### Fields

- **`repo`** (string, required): The name of the repository to fetch.
- **`owner`** (string, required): The GitHub username or organization name that owns the repository.

### Notes
- Ensure that the `repo` and `owner` fields are correctly specified as required to avoid validation errors.


### Fetch Repository Data

#### Endpoint

**`GET /api/v1/fetch-github-repository`**

#### Description

Fetch repository details and commit history from GitHub based on the specified repository name and owner. The results can be filtered and paginated using the provided parameters. Defualts 10 commits per page.

#### Request Body

The request body should be a JSON object with the following structure:

```json
{
  "repo": "string",
  "owner": "string",
  "commit_filter": {
    "per_page": "uint16",
    "page": "uint16"
  }
}
```

#### Fields

- **`repo`** (string, required): The name of the repository to fetch.
- **`owner`** (string, required): The GitHub username or organization name that owns the repository.
- **`commit_filter`** (object, optional): A filter object to paginate the commit history.
  - **`per_page`** (uint16, optional): The number of commits to return per page. Defaults to a standard value if not provided.
  - **`page`** (uint16, optional): The page number to retrieve, useful for paginated results. Defaults to the first page if not provided.

### Notes
- Ensure that the `repo` and `owner` fields are correctly specified as required to avoid validation errors.
- Use the `commit_filter` for efficient pagination, especially when dealing with repositories with a large number of commits.


## API Response Structure

```json
{
  "message": "string response",
  "status_code": "integer response code, e.g 200, 400 ",
  "data": "object",
  "error": "string error message"
}
```


## Error codes Responses

- **400**:  Bad Request.
  
- **404**: Not found.

- **500**: Internal Server Error




## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

## Resources

- [GitHub REST API Documentation](https://docs.github.com/en/rest)

---