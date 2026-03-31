#!/bin/bash
# Script 4: Log File Analyzer
# Usage: ./script4.sh /var/log/dpkg.log "warning"

LOGFILE=$1
# Default keyword is 'error' if no second argument is provided
KEYWORD=${2:-"error"}
COUNT=0

# Check if user provided a file argument
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <path-to-logfile> [keyword]"
    exit 1
fi

# Do-while style retry if the file does not exist or is empty
while [ ! -f "$LOGFILE" ] || [ ! -s "$LOGFILE" ]; do
    echo "Error: File $LOGFILE not found or is empty."
    read -p "Please enter a valid, non-empty log file path: " LOGFILE
done

# Read file line by line
while IFS= read -r LINE; do
    # Check if the line contains the keyword (case-insensitive)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "======================================"
echo "Keyword '$KEYWORD' found $COUNT times in $LOGFILE"
echo "======================================"
echo "Last 5 matching lines:"
# Print the last 5 matching lines using tail + grep
grep -i "$KEYWORD" "$LOGFILE" | tail -n 5