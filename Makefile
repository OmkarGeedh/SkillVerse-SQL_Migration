.PHONY: build test fmt fmt-check import import-check mental-maths seed migrate-up migrate-down migrate-version reset docker-build docker-up docker-down

DB_BIN := ./bin/game-db

build:
	go build -o $(DB_BIN) ./cmd/db

test:
	go test -race ./...

fmt:
	gofmt -w cmd internal

fmt-check:
	@files="$$(gofmt -l cmd internal)"; \
	if [ -n "$$files" ]; then echo "Unformatted Go files:"; echo "$$files"; exit 1; fi

# CSV (Sheets Dump/) -> seeds/sql/*.sql
import:
	go run ./cmd/db import

import-check:
	go run ./cmd/db import -check

# Regenerate the arithmetic CSVs, then run `make import`
mental-maths:
	go run ./cmd/db gen-mental-maths

seed:
	go run ./cmd/db seed

migrate-up:
	go run ./cmd/db migrate up

migrate-down:
	go run ./cmd/db migrate down

migrate-version:
	go run ./cmd/db migrate version

# Destroys every table and row in the target database, then rebuilds schema + content.
reset:
	go run ./cmd/db migrate reset
	go run ./cmd/db seed

docker-build:
	docker build -t skillverse-migrator .

docker-up:
	docker compose up -d postgres
	docker compose run --rm migrator

docker-down:
	docker compose down
