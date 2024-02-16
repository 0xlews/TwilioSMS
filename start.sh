#!/bin/bash

clear

# Print a message with typewriter effect
print_with_delay() {
    local message=$1
    local color=$2
    local delay=${3:-0.1}
    echo -n "$color"
    for (( i=0; i<${#message}; i++ )); do
        echo -n "${message:$i:1}"
        sleep $delay
    done
    echo -e "\033[0m"  # Reset color
}

# Function to display a progress bar
display_progress_bar() {
    local duration=${1}
    local step=$((duration / 50))
    
    echo -n "["
    for i in $(seq 1 50); do
        sleep "$step"
        echo -n "#"
    done
    echo "]"
}

print_with_delay "Setting up TwilioSMS" "$(tput setaf 4)"
echo -e "\nChecking dependencies...\n"

# Check and display progress for Python
check_dependency() {
    local dependency=$1
    local name=$2

    if ! command -v "$dependency" &> /dev/null; then
        echo -e "$name could not be found. Please install $name."
        exit 1
    else
        echo -n "Checking for $name..."
        display_progress_bar 2
        echo -e " Found."
    fi
}

check_dependency python3 "Python"
check_dependency pip "pip"

echo -e "\nInstallation complete." "$(tput setaf 2)"

# Run send.sh
bash send.sh
