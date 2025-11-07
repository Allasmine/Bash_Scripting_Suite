#!/bin/bash
# monitor.sh - Displays system resource usage and logs it

LOG_FILE="maintenance.log"

echo "=============================================" | tee -a "$LOG_FILE"
echo "[$(date)] System Monitor Started" | tee -a "$LOG_FILE"
echo "---------------------------------------------" | tee -a "$LOG_FILE"

# Display and log CPU usage
echo "CPU Usage:" | tee -a "$LOG_FILE"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Load: " $2 + $4 "%"}' | tee -a "$LOG_FILE"

# Display and log Memory usage
echo -e "\nMemory Usage:" | tee -a "$LOG_FILE"
free -h | tee -a "$LOG_FILE"

# Display and log Disk usage
echo -e "\nDisk Usage:" | tee -a "$LOG_FILE"
df -h | tee -a "$LOG_FILE"

echo "---------------------------------------------" | tee -a "$LOG_FILE"
echo "[$(date)] System Monitor Completed" | tee -a "$LOG_FILE"
echo "=============================================" | tee -a "$LOG_FILE"
