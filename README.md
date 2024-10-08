# GitHub API Data Fetching Service

This repository contains a Golang service that interacts with GitHub's public APIs to fetch and store repository information and commit history. The service also includes functionality to monitor repositories for changes and keep the stored data in sync with GitHub.

## Table of Contents
 
- [GitHub API Data Fetching Service](#github-api-data-fetching-service)
  - [Table of Contents](#table-of-contents)
  - [Project Structure](#project-structure)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
    - [Configuration](#configuration)
    - [Usage](#usage)
    - [Requested Query](#requested-query)
  - [Tests](#tests)
  - [Deployment](#deployment)
  - [Performance Considerations](#performance-considerations)
  - [Error Handling](#error-handling)
  - [API Documentation](#api-documentation)
    - [Index A GitHub Repository](#index-a-github-repository)
      - [Endpoint](#endpoint)
      - [Description](#description)
      - [Request Body](#request-body)
      - [Fields](#fields)
      - [Notes](#notes)
    - [Fetch Repository Data](#fetch-repository-data)
      - [Endpoint](#endpoint-1)
      - [Description](#description-1)
      - [Request Body](#request-body-1)
      - [Fields](#fields-1)
      - [Notes](#notes-1)
    - [Get Top N Commit Authors By Commit Count](#get-top-n-commit-authors-by-commit-count)
      - [Endpoint](#endpoint-2)
      - [Description](#description-2)
      - [Request Body](#request-body-2)
      - [Fields](#fields-2)
    - [Truncate Commits From A Specific Date](#truncate-commits-from-a-specific-date)
      - [Endpoint](#endpoint-3)
      - [Description](#description-3)
      - [Request Body](#request-body-3)
      - [Fields](#fields-3)
      - [Notes](#notes-2)
  - [API Response Structure](#api-response-structure)
  - [Error Codes Responses](#error-codes-responses)
  - [Contributing](#contributing)
  - [License](#license)
  - [Resources](#resources)

## Project Structure

```plaintext
.
├── cmd
│   └── reposvc           # Entry point for the service
│     └── main.go 
├── config
│   └── local.yml         # Configuration settings
├── internal
│   ├── config            # App configuration logic
│   ├── healtcheck        # API healthcheck logic
│   ├── githubrepository  # GitHub API interaction logic
│   ├── db                # Database models and interactions
│   └── tests             # Unit tests for core functions
├── pkg
│   └── log               # Log logic for the application
├── scripts
│   └── *.sql             # Database migration scripts
│   └── seed_data.go      # Script to seed the database with initial data
├── docker-compose.yml    # Docker Compose for multi-container setup
├── Dockerfile            # Dockerfile to containerize the application 
└── README.md             # This file
```

## Getting Started

### Prerequisites

- [Go](https://golang.org/doc/install) (version 1.22+)
- [PostgreSQL](https://www.postgresql.org/download/)
- [Docker](https://www.docker.com/products/docker-desktop) (for containerized deployment)

### Installation

  1. Clone the repository:

      ```bash
      git clone https://github.com/omept/reposvc.git

      cd reposvc
      ```
  
  2. Run with Docker if you have it installed:

      ```bash
      docker compose up --build -d
      ```
      
    Alternatively, continue the steps below to build the aplication manually
    
  3. Get go dependencies:

      ```bash
      go mod tidy
      ```

  4. Set up the environment variables by creating a `.env` file based on `.env.example` and get go dependencies.


     ```bash
      cp .env.example .env
      ```

 

  5.  Update the .env credentials to match your machine. Postgres is the database used in the application.
   
  6. Seed the database (optional):

      ```bash
      go run scripts/seed_data.go
      ```

  7. Build and run the service:

      ```bash
      go build -o github-repo-indexer ./cmd/reposvc
      ./github-repo-indexer
      ```


### Configuration

All configuration settings (e.g. database connections) are managed through environment variables defined in the `.env` file.

### Usage

- **Fetch and store repository and commit data:**

    The service automatically fetches and stores data for the specified repositories based on the configuration. The data is stored in a PostgreSQL database.

- **Monitor repository for changes:**

    The service continuously monitors the repository and updates the database with new commits as they appear on GitHub.

### Requested Query

- **Check API docs section on how to get the top N commit authors by commit counts from the database:**

## Tests

The project includes unit tests for core functionalities, located in the `internal/tests` directory. To run the tests:

```bash
go test ./internal/tests
```

## Deployment

For deployment, the service can be containerized using Docker. Use the provided `Dockerfile` and `docker-compose.yml` for easy setup.
```bash
docker compose up -d 
```
## Performance Considerations

- **Efficient data storage**: Indexed fields and optimized queries ensure fast retrieval of commit data.
- **Scalability**: The service is designed to handle large datasets and can be scaled horizontally with multiple instances.

## Error Handling

The service includes robust error handling with clear and meaningful error messages. All critical operations are monitored and logged.

## API Documentation

### Index A GitHub Repository

#### Endpoint

**`POST /api/v1/index-github-repository`**

#### Description

Index repository gets repository details and commit history from GitHub based on the specified repository name and owner, then saves it locally. The repository is also monitored for future commits.

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

#### Notes
- Ensure that the `repo` and `owner` fields are correctly specified as required to avoid validation errors.

### Fetch Repository Data

#### Endpoint

**`GET /api/v1/fetch-github-repository`**

#### Description

Fetch repository details and commit history from GitHub based on the specified repository name and owner. The results can be filtered and paginated using the provided parameters. Defaults to 10 commits per page.

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

#### Notes
- Ensure that the `repo` and `owner` fields are correctly specified as required to avoid validation errors.
- Use the `commit_filter` for efficient pagination, especially when dealing with repositories with a large number of commits.

### Get Top N Commit Authors By Commit Count

#### Endpoint

**`GET /api/v1/top-commit-authors`**

#### Description

Fetch the top committers by commit count. The limit is the max number of rows returned and it defaults to 10.

#### Request Body

The request body should be a JSON object with the following structure:

```json
{
  "limit": "uint16"
}
```

#### Fields

- **`limit`** (uint16, optional): The number of authors to return. Defaults to a standard value if not provided.

### Truncate Commits From A Specific Date 

#### Endpoint

**`DELETE /api/v1/truncate-commits-from`**

#### Description

Truncates the commits of a repository from a specific date and triggers commit indexing from the date.

#### Request Body

The request body should be a JSON object with the following structure:

```json
{
  "repo": "string",
  "owner": "string",
  "date": "date"
}
```

#### Fields

- **`date`** (date, required): The date to truncate a repository's commits from. e.g "2024

-05-01".
- **`repo`** (string, required): The name of the repository to fetch.
- **`owner`** (string, required): The GitHub username or organization name that owns the repository.

#### Notes
- Ensure that the `repo` and `owner` fields are correctly specified as required to avoid validation errors.

## API Response Structure

```json
{
  "message": "string response",
  "status_code": "integer response code, e.g 200, 400",
  "data": "object",
  "error": "string error message"
}
```

## Error Codes Responses

- **400**:  Bad Request.
  
- **404**: Not found.

- **500**: Internal Server Error

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

## Resources

- [GitHub REST API Documentation](https://docs.github.com/en/rest)
