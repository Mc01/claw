#!/bin/sh
set -e
chown -R node:node /app/config/agents 2>/dev/null || true
exec su node -c "$*"
