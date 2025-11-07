#!/bin/bash
# backup.sh - Automated system backup script for Capstone Project

set -o errexit
set -o nounset
set -o pipefail

LOG_FILE="$(pwd)/maintenance.log"
BACKUP_SRC="/home/$USER"                # change if you want different source
BACKUP_DEST="$(pwd)/backups"            # store backups inside project for demo
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DEST/backup_$DATE.tar.gz"

mkdir -p "$BACKUP_DEST"

echo "[$(date +"%Y-%m-%d %H:%M:%S")] Starting backup: $BACKUP_SRC -> $BACKUP_FILE" | tee -a "$LOG_FILE"

# create tar.gz (exclude large/undesired dirs)
tar --exclude="$BACKUP_DEST" -czf "$BACKUP_FILE" "$BACKUP_SRC" 2>>"$LOG_FILE" || {
  echo "[$(date)] Backup failed!" | tee -a "$LOG_FILE"
  exit 1
}

echo "[$(date +"%Y-%m-%d %H:%M:%S")] Backup successful: $BACKUP_FILE" | tee -a "$LOG_FILE"
