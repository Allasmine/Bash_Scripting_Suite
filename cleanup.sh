#!/bin/bash
# cleanup.sh - removes temporary and cache files

LOG_FILE="maintenance.log"
echo "[$(date)] Cleanup started" | tee -a "$LOG_FILE"

sudo rm -rf /tmp/*
sudo apt-get clean
sudo journalctl --vacuum-time=3d

echo "[$(date)] Cleanup completed successfully." | tee -a "$LOG_FILE"
