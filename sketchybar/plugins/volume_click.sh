#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

EXPANDED=$(sketchybar --query volume_slider 2>/dev/null | grep -o '"drawing":"[^"]*"' | cut -d'"' -f4)

if [ "$EXPANDED" = "on" ]; then
  # Collapse - hide slider
  sketchybar --set volume_slider drawing=off \
             --set volume_icon label.drawing=off
else
  # Expand - show slider with current volume
  VOLUME=$(osascript -e 'output volume of (get volume settings)')
  sketchybar --set volume_slider drawing=on slider.percentage="$VOLUME" \
             --set volume_icon label.drawing=on label="${VOLUME}%"
fi
