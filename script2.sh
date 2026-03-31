#!/bin/bash
# Script 2: FOSS Package Inspector
# Description: Checks if a software is installed and prints its philosophy.

PACKAGE="git"

# Check if package is installed using dpkg
if dpkg -l "$PACKAGE" &> /dev/null; then
    echo "SUCCESS: $PACKAGE is installed on this system."
    # Extracting basic info 
    dpkg -s "$PACKAGE" | grep -E 'Version|Status|Maintainer'
else
    echo "WARNING: $PACKAGE is NOT installed."
fi

echo "--------------------------------------"
# A case statement that prints a one-line philosophy note about the package based on its name
case $PACKAGE in
    (httpd|apache2) 
        echo "Apache: The web server that built the open internet." 
        ;;
    (mysql) 
        echo "MySQL: Open source at the heart of millions of apps." 
        ;;
    (firefox)
        echo "Firefox: A nonprofit browser fighting for an open and free web."
        ;;
    (vlc)
        echo "VLC: Plays anything - built by students in Paris, completely open."
        ;;
    (python3|python)
        echo "Python: A language shaped entirely by the community."
        ;;
    (git)
        echo "Git: The tool Linus built when proprietary failed him."
        ;;
    (*) 
        echo "$PACKAGE: A great example of the open-source ecosystem." 
        ;;
esac