#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

# Get date components
DAY=$(date '+%a')
DATE=$(date '+%b %d')
TIME=$(date '+%I:%M %p')

# Icons
ICON_CAL="󰃭"
ICON_CLOCK=""

# Format with icons: 󰃭 Sat, Dec 06   10:30 PM
sketchybar --set "$NAME" label="${DAY}, ${DATE}  ${TIME}"
