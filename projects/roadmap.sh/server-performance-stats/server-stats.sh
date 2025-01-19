#!/bin/bash


# Total CPU usage 
echo "Total Cpu(s) Usage (%): "
top -bn1 | grep "%Cpu(s):" | awk '{print "Total Usage: " 100 - $8 "%" "\tUser processes: " $2 "%" "\tSystem Usage: " $4 "%" "\tIdle Cpu: " $8 "%" }'
echo

# Total memory usage (Free vs Used including percentage)
echo "Total Memory Usage: "
free -h | awk 'NR==2 {print "Total Memory: " ($2) "\t Used: " $3 " (" ($3 / $2 * 100) "%) \tFree: " $7 " (" ($7/$2*100) "%)" }'
echo

# Total disk usage (Free vs Used including percentage)
echo "Total disk usage: "
df -h --total | awk '/total/ {print "Total: " $2 "\tUsed: " $3 " (" $5 ")" "\tFree: " $4 " (" ($4/$2 * 100) "%)"}'
echo

# Top 5 processes by CPU usage
echo "Top 5 processes by CPU usage: "
top -bn1 -o %CPU | grep PID -A 5
echo

# Top 5 processes by memory usage
echo "Top 5 processes by CPU usage: "
top -bn1 -o %MEM | grep PID -A 5
echo
