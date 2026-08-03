#!/usr/bin/env sh
set -eu

APP_DIR="${APP_DIR:-/opt/Requiem}"
REPO_URL="https://github.com/Ventrex/Requiem.git"

if ! command -v git >/dev/null 2>&1; then
  apt-get update && apt-get install -y git
fi

if ! command -v docker >/dev/null 2>&1; then
  echo "Docker ontbreekt. Installeer eerst Docker in deze LXC/VM."
  exit 1
fi

if [ -d "$APP_DIR/.git" ]; then
  cd "$APP_DIR"
  git pull --ff-only
else
  mkdir -p "$(dirname "$APP_DIR")"
  git clone "$REPO_URL" "$APP_DIR"
  cd "$APP_DIR"
fi

chmod +x install.sh update.sh backup-original.sh
docker compose up -d --build

echo "Requiem draait op: http://$(hostname -I | awk '{print $1}'):8384"
