#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Description: Generates a personalized open-source statement.

echo "======================================"
echo "Answer three questions to generate your manifesto."
echo "======================================"
echo

read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

DATE=$(date '+%d %B %Y')
USER="Chirayu_Jain"
OUTPUT="manifesto_${USER}.txt"

# Clear file if it exists, or create a new one
> "$OUTPUT"

# Compose a paragraph using the variables and write it to OUTPUT
echo "--- The Open Source Manifesto of $USER ---" >> "$OUTPUT"
echo "Date: $DATE" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "I believe that software should be built in the open. Every day, I rely on tools like $TOOL to do my work and expand my skills." >> "$OUTPUT"
echo "To me, the core of the open-source philosophy comes down to one word: $FREEDOM." >> "$OUTPUT"
echo "If I could contribute to this ecosystem, I would build a $BUILD and share its source code freely so that others can learn, modify, and improve it." >> "$OUTPUT"

echo "--------------------------------------"
echo "Manifesto generated and saved to $OUTPUT"
echo "Here is what it looks like:"
echo "--------------------------------------"
# Display the file contents
cat "$OUTPUT"