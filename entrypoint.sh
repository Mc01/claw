#!/bin/sh
set -e

echo "Securing OpenClaw configuration..."

# Check if the config file exists in the mounted volume
if [ -f "/app/config/openclaw.json" ]; then
    # Change ownership to the node user
    chown node:node /app/config/openclaw.json
    # Enforce strict 600 permissions
    chmod 600 /app/config/openclaw.json
    echo "[OK] openclaw.json locked to 600."
else
    echo "[WARNING] openclaw.json not found in mount!"
fi

# Drop root privileges and execute the main OpenClaw startup command
echo "Starting OpenClaw..."
exec su node -c "$*"
