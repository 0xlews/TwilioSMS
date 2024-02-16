#!/bin/bash

clear

# Print a welcome message with typewriter effect
print_with_delay() {
    local message=$1
    local color=$2
    local delay=${3:-0.1}
    echo -ne "$color"
    for (( i=0; i<${#message}; i++ )); do
        echo -n "${message:$i:1}"
        sleep $delay
    done
    echo -ne "\033[0m"  # Reset color
}

# Welcome message
print_with_delay "Welcome to Twilio" "$(tput setaf 7)"  # Default terminal color
print_with_delay "SMS" "$(tput setaf 2)"  # Green color

echo -e "\n\nThis tool allows you to send anonymous SMS messages.\n"

# Loading animation
echo -n "Preparing to send messages "
for i in {1..3}; do
    echo -n "."
    sleep 0.5
done
echo -e "\n"

# Instructions
print_with_delay "Please follow the instructions below:" "$(tput setaf 2)"
echo -e "\n"

python3 send.py
