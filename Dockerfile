# Stage 1: Build binary
FROM golang:1.25-alpine AS builder

WORKDIR /src

RUN apk add --no-cache git build-base

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o /bin/game-db ./cmd/db

# Stage 2: Minimal runtime image
FROM alpine:3.20

RUN apk add --no-cache ca-certificates tzdata bash

WORKDIR /app

COPY --from=builder /bin/game-db /app/game-db
COPY migrations /app/migrations
COPY seeds/sql /app/seeds/sql
COPY docker-entrypoint.sh /app/docker-entrypoint.sh
RUN chmod +x /app/docker-entrypoint.sh

ENV DB_URL=""

ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["sync"]
