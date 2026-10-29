#!/bin/bash
set -euo pipefail

wait_for_db() {
    until ./game-db migrate version >/dev/null 2>&1; do
        echo "==> PostgreSQL not ready yet, retrying in 2 seconds..."
        sleep 2
    done
}

case "${1:-sync}" in
    sync)
        wait_for_db
        ./game-db migrate up
        ./game-db seed
        ;;
    migrate|seed)
        wait_for_db
        exec ./game-db "$@"
        ;;
    *)
        exec "$@"
        ;;
esac
