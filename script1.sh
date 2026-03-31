#!/bin/bash
# Script 1: System Identity Report
# Author: Chirayu Jain
# Course: Open Source Software
# Description: Displays basic Linux system information.

# --- Variables
STUDENT_NAME="Chirayu Jain"
SOFTWARE_CHOICE="Git" 

# --- System info
KERNEL=$(uname -r)
USER_NAME=$(whoami)
UPTIME=$(uptime -p)
DISTRO=$(cat /etc/os-release | grep "^PRETTY_NAME" | cut -d '"' -f 2)
CURRENT_DATE=$(date +"%A, %d %B %Y %T")

# --- Display
echo "======================================"
echo "          Open Source Audit           "
echo "======================================"
echo "Student Name : $STUDENT_NAME"
echo "Software     : $SOFTWARE_CHOICE"
echo "--------------------------------------"
echo "OS / Distro  : $DISTRO"
echo "Kernel       : $KERNEL"
echo "User         : $USER_NAME"
echo "Home Dir     : $HOME"
echo "Date & Time  : $CURRENT_DATE"
echo "Uptime       : $UPTIME"
echo "OS License   : Most Linux distributions are covered by the GNU GPL and other FOSS licenses."
echo "======================================"