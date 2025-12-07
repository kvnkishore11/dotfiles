#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

# Get CPU usage (top process)
CPU_INFO=$(ps -A -o %cpu,comm | sort -rn | head -2 | tail -1)
CPU_PERCENT=$(echo "$CPU_INFO" | awk '{print int($1)}')
CPU_PROCESS=$(echo "$CPU_INFO" | awk '{print $2}' | cut -d'/' -f1 | cut -c1-12)

# Color based on load
if [ "$CPU_PERCENT" -ge 80 ]; then
  COLOR=$RED
elif [ "$CPU_PERCENT" -ge 50 ]; then
  COLOR=$YELLOW
else
  COLOR=$GREEN
fi

sketchybar --set "$NAME" \
  icon="$ICON_CPU" \
  icon.color="$COLOR" \
  label="${CPU_PERCENT}% ${CPU_PROCESS}"
