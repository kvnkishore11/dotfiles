#!/bin/bash

# Format: Day, Mon DD  HH:MM AM/PM
DATE=$(date '+%a, %b %d  %I:%M %p')

sketchybar --set "$NAME" label="$DATE"
