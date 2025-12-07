#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

# Get current volume
VOLUME=$(osascript -e 'output volume of (get volume settings)')
MUTED=$(osascript -e 'output muted of (get volume settings)')

# Determine icon based on volume level
if [ "$MUTED" = "true" ] || [ "$VOLUME" -eq 0 ]; then
  ICON=$ICON_VOLUME_MUTE
  COLOR=$OVERLAY0
elif [ "$VOLUME" -ge 66 ]; then
  ICON=$ICON_VOLUME_HIGH
  COLOR=$PEACH
elif [ "$VOLUME" -ge 33 ]; then
  ICON=$ICON_VOLUME_MID
  COLOR=$PEACH
else
  ICON=$ICON_VOLUME_LOW
  COLOR=$PEACH
fi

# Update main volume icon
sketchybar --set volume_icon icon="$ICON" icon.color="$COLOR"

# Update slider if it exists
sketchybar --set volume_slider slider.percentage="$VOLUME" 2>/dev/null
