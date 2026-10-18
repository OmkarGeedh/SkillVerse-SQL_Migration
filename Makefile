.PHONY: build test fmt-check fmt pipeline-run dq profile export-csv export-sql migrate-up migrate-down migrate-version seed seed-validate seed-export-sql docker-build docker-sync docker-up docker-down

DB_BIN := ./bin/game-db

build:
	go build -o $(DB_BIN) ./cmd/db

test:
	go test -race ./...

fmt:
	gofmt -w $$(find cmd internal -name '*.go' -type f 2>/dev/null)

fmt-check:
	@files="$$(gofmt -l $$(find cmd internal -name '*.go' -type f 2>/dev/null))"; \
	if [ -n "$$files" ]; then echo "Unformatted Go files:"; echo "$$files"; exit 1; fi

# ── Data Engineering & Pipeline ──
pipeline-run:
	go run ./cmd/db pipeline

dq:
	go run ./cmd/db dq

profile:
	go run ./cmd/db profile

export-csv:
	go run ./cmd/db export -format csv -out "Sheets Dump/questions_master.csv"

export-sql:
	go run ./cmd/db export -format sql

# ── Database Migrations ──
migrate-up:
	go run ./cmd/db migrate up

migrate-down:
	go run ./cmd/db migrate down

migrate-version:
	go run ./cmd/db migrate version

migrate-drop:
	go run ./cmd/db migrate drop

migrate-reset:
	go run ./cmd/db migrate reset

# ── Seeds & Backwards Compatibility ──
seed:
	go run ./cmd/db seed

seed-validate:
	go run ./cmd/db seed validate

seed-export-sql:
	go run ./cmd/db seed export-sql

# ── Docker ──
docker-build:
	docker build -t skillverse-migrator .

docker-sync:
	docker compose run --rm migrator sync-and-migrate

docker-up:
	docker compose up -d postgres
	docker compose run --rm migrator sync-and-migrate

docker-down:
	docker compose down
