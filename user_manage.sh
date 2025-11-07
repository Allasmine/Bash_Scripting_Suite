#!/bin/bash
# user_manage.sh - Simple user management script

LOG_FILE="maintenance.log"

echo "=============================================" | tee -a "$LOG_FILE"
echo "[$(date)] User Management Script Started" | tee -a "$LOG_FILE"

echo "Choose an option:"
echo "1. Add User"
echo "2. Delete User"
echo "3. List Users"
read -p "Enter choice [1-3]: " choice

case $choice in
  1)
    read -p "Enter username to add: " username
    if id "$username" &>/dev/null; then
      echo "User '$username' already exists!" | tee -a "$LOG_FILE"
    else
      sudo useradd "$username"
      echo "User '$username' added successfully." | tee -a "$LOG_FILE"
    fi
    ;;
  2)
    read -p "Enter username to delete: " username
    if id "$username" &>/dev/null; then
      sudo userdel "$username"
      echo "User '$username' deleted successfully." | tee -a "$LOG_FILE"
    else
      echo "User '$username' does not exist!" | tee -a "$LOG_FILE"
    fi
    ;;
  3)
    echo "Listing all users:" | tee -a "$LOG_FILE"
    cut -d: -f1 /etc/passwd | tee -a "$LOG_FILE"
    ;;
  *)
    echo "Invalid option!" | tee -a "$LOG_FILE"
    ;;
esac

echo "[$(date)] User Management Script Completed" | tee -a "$LOG_FILE"
echo "=============================================" | tee -a "$LOG_FILE"
