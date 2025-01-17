#!/bin/bash

echo "================ Server Performance Stats ================"

# Total CPU Usage
echo "1. Total CPU Usage:"
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
echo "   CPU Usage: $CPU_USAGE%"

# Total Memory Usage
echo "2. Total Memory Usage:"
MEMORY_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
MEMORY_USED=$(free -m | awk '/Mem:/ {print $3}')
MEMORY_FREE=$(free -m | awk '/Mem:/ {print $4}')
MEMORY_PERCENT=$(awk "BEGIN {printf \"%.2f\", ($MEMORY_USED / $MEMORY_TOTAL) * 100}")
echo "   Total Memory: ${MEMORY_TOTAL}MB"
echo "   Used Memory: ${MEMORY_USED}MB"
echo "   Free Memory: ${MEMORY_FREE}MB"
echo "   Memory Usage: ${MEMORY_PERCENT}%"

# Total Disk Usage
echo "3. Total Disk Usage:"
DISK_TOTAL=$(df -h --total | grep 'total' | awk '{print $2}')
DISK_USED=$(df -h --total | grep 'total' | awk '{print $3}')
DISK_AVAILABLE=$(df -h --total | grep 'total' | awk '{print $4}')
DISK_PERCENT=$(df -h --total | grep 'total' | awk '{print $5}')
echo "   Total Disk: $DISK_TOTAL"
echo "   Used Disk: $DISK_USED"
echo "   Available Disk: $DISK_AVAILABLE"
echo "   Disk Usage: $DISK_PERCENT"

# Top 5 Processes by CPU Usage
echo "4. Top 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6

# Top 5 Processes by Memory Usage
echo "5. Top 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -n 6

echo "=========================================================="
