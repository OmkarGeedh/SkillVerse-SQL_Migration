#!/bin/bash
set -euo pipefail

DB_CONN="${DB_URL:-${DATABASE_URL:-}}"

wait_for_db() {
    if [ -n "$DB_CONN" ]; then
        echo "==> Checking PostgreSQL connection..."
        until ./game-db migrate version >/dev/null 2>&1 || [ $? -eq 0 ]; do
            echo "==> PostgreSQL not ready yet, retrying in 2 seconds..."
            sleep 2
        done
        echo "==> PostgreSQL is reachable!"
    fi
}

case "${1:-sync-and-migrate}" in
    sync-and-migrate)
        wait_for_db
        echo "==> Applying database migrations..."
        ./game-db migrate up
        echo "==> Running data pipeline (ETL, DQ, Load)..."
        ./game-db pipeline run -strict=false || ./game-db seed -format all
        echo "==> PostgreSQL migrations and data pipeline complete!"
        ;;
    pipeline)
        wait_for_db
        shift
        ./game-db pipeline "$@"
        ;;
    dq|test)
        shift
        ./game-db dq "$@"
        ;;
    profile)
        shift
        ./game-db profile "$@"
        ;;
    export)
        shift
        ./game-db export "$@"
        ;;
    migrate)
        wait_for_db
        shift
        ./game-db migrate "$@"
        ;;
    seed)
        if [ "${2:-}" != "validate" ] && [ "${2:-}" != "export-sql" ]; then
            wait_for_db
        fi
        shift
        ./game-db seed "$@"
        ;;
    *)
        exec "$@"
        ;;
esac
