#!/usr/bin/env sh
set -eu
cd "$(dirname "$0")"
git pull --ff-only
docker compose up -d --build --remove-orphans
docker image prune -f
