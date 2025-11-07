#!/bin/bash
# report.sh - Generates a system summary report

LOG_FILE="maintenance.log"
REPORT_FILE="system_report_$(date +%Y%m%d_%H%M%S).txt"

echo "=============================================" | tee -a "$LOG_FILE"
echo "[$(date)] Generating System Report" | tee -a "$LOG_FILE"
echo "---------------------------------------------" | tee -a "$LOG_FILE"

{
  echo "========== SYSTEM SUMMARY REPORT =========="
  echo "Report generated on: $(date)"
  echo
  echo "HOSTNAME: $(hostname)"
  echo "OS VERSION: $(lsb_release -d | cut -f2)"
  echo "SYSTEM UPTIME: $(uptime -p)"
  echo
  echo "MEMORY USAGE:"
  free -h
  echo
  echo "DISK USAGE:"
  df -h
  echo
  echo "LOGGED-IN USERS:"
  who
  echo
  echo "==========================================="
} | tee "$REPORT_FILE" | tee -a "$LOG_FILE"

echo "System report saved as $REPORT_FILE" | tee -a "$LOG_FILE"
echo "[$(date)] System Report Completed" | tee -a "$LOG_FILE"
echo "=============================================" | tee -a "$LOG_FILE"
