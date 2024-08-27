FROM golang:1.22-alpine

WORKDIR /app

COPY go.mod  ./
RUN go mod tidy

COPY . .

# Build the Go application
RUN  GOARCH=amd64 go build -o /main ./cmd/reposvc

EXPOSE 8088

CMD ["/main"]