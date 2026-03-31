#!/bin/bash
# Script 3: Disk and Permission Auditor
# Description: Loops through system directories and reports size and permissions.

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "======================================"
echo "       Directory Audit Report         "
echo "======================================"

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Getting permissions, owner, and group using ls and awk
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        # Getting size using du (Disk Usage)
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        echo "$DIR => Permissions/Owner: $PERMS | Size: $SIZE"
    else
        echo "$DIR does not exist on this system."
    fi
done

echo "--------------------------------------"
# Checking config directory for chosen software (Example: Firefox)
CONFIG_DIR="$HOME/.mozilla/firefox"
if [ -d "$CONFIG_DIR" ]; then
    CONF_PERMS=$(ls -ld "$CONFIG_DIR" | awk '{print $1, $3, $4}')
    echo "Your software config ($CONFIG_DIR) exists with perms: $CONF_PERMS"
else
    echo "Your software's config directory was not found in standard locations."
fi