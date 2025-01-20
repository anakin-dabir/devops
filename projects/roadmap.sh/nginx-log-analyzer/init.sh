#!/bin/bash

# Downloading log file
FILE_URL=https://gist.githubusercontent.com/kamranahmedse/e66c3b9ea89a1a030d3b739eeeef22d0/raw/77fb3ac837a73c4f0206e78a236d885590b7ae35/nginx-access.log
LOG_FILE=$HOME/nginx-access.log

if [ ! -f "$LOG_FILE" ]; then
    echo "Downloading log file..."
    curl -o $LOG_FILE $FILE_URL
fi

# Top 5 IP addresses with the most requests
echo -e "\nTop 5 IP addresses with the most requests: "
awk '{count[$1]++} END {for(ip in count) print ip, "-", count[ip], "requests"}' $LOG_FILE | sort -nr -k3 | head -5

# Top 5 most requested paths
echo -e "\nTop 5 most requested paths: "
awk '{count[$7]++} END {for(path in count) print path, "-", count[path], "requests"}' $LOG_FILE | sort -nr -k3 | head -5

# Top 5 response status codes
echo -e "\nTop 5 response status codes: "
awk '{count[$9]++} END {for(code in count) print code, "-", count[code], "requests"}' $LOG_FILE | sort -nr -k3 | head -5

# Top 5 user agents
echo -e "\nTop 5 user agents: "
awk -F'"' '{print $6}' $LOG_FILE | sort | uniq -c | sort -nr | head -5 | awk '{print substr($0, index($0, $2)) " - " $1 " requests"}'
