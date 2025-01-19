#!/bin/bash

# Checking for args
if [ -z "$1" ]; then
    echo "Usage: $0 <log-directory>"
    exit 1
fi

# Checking if dir exists?
LOG_DIR="$1"
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Log Directory $LOG_DIR doesn't exist"
    exit 1
fi

# Creating dir, timestamp variables
ARCHIVE_DIR="$HOME/logs"
mkdir -p $ARCHIVE_DIR

TIMESTSAMP=$(date +"%Y%m%d_%H%M%S")
FILENAME="logs_archive_$TIMESTSAMP.tar.gz"

# Creating archive
tar -czf $ARCHIVE_DIR/$FILENAME $LOG_DIR/*

echo "Log archive $FILENAME stored in: $ARCHIVE_DIR"