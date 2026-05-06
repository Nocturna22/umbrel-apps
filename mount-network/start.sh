#!/bin/sh

echo "Installing CIFS tools..."
apk add --no-cache cifs-utils

# Variablen (anpassen!)
USERNAME="Username"
PASSWORD="Password"
SERVER="192.168.111.1"
SHARE="Fritzbox-Fynn-NAS"

MOUNT_BASE="/mnt/network"
MOUNT_PATH="$MOUNT_BASE/$SERVER/$SHARE"

echo "Creating mount directory: $MOUNT_PATH"
mkdir -p "$MOUNT_PATH"

echo "Mounting CIFS share..."

mount -t cifs \
  -o rw,vers=3.0,noserverino,username=$USERNAME,password="$PASSWORD" \
  "//$SERVER/$SHARE/" \
  "$MOUNT_PATH"

echo "Mount complete."

# Container am Leben halten
tail -f /dev/null
