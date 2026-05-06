#!/bin/sh

echo "Installing CIFS tools..."
apk add --no-cache cifs-utils

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

if [ $? -eq 0 ]; then
  echo "Mount successful"
else
  echo "Mount failed"
fi

# Container alive halten
tail -f /dev/null
