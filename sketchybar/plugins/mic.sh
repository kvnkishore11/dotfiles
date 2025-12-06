#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

# Check if mic is muted
MIC_VOLUME=$(osascript -e 'input volume of (get volume settings)')

if [ "$MIC_VOLUME" -eq 0 ]; then
  ICON=$ICON_MIC_MUTE
  COLOR=$RED
else
  ICON=$ICON_MIC
  COLOR=$GREEN
fi

sketchybar --set "$NAME" \
  icon="$ICON" \
  icon.color="$COLOR"
