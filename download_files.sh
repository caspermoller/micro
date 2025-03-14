#!/bin/bash

# Define the destination folder
DESTINATION="$HOME/.config/micro"

# Ensure the destination folder exists
mkdir -p "$DESTINATION"

# Download the files
curl -o "$DESTINATION/init.lua" "https://raw.githubusercontent.com/caspermoller/micro/main/init.lua"
curl -o "$DESTINATION/settings.json" "https://raw.githubusercontent.com/caspermoller/micro/main/settings.json"

echo "Files downloaded successfully!"
