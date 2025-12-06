#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

# Use the environment variable if available, otherwise query aerospace
if [ -n "$FOCUSED_WORKSPACE" ]; then
  CURRENT_WORKSPACE="$FOCUSED_WORKSPACE"
else
  CURRENT_WORKSPACE=$(aerospace list-workspaces --focused 2>/dev/null)
fi

# Get workspace ID from the item name (space.1 -> 1, space.C -> C)
WORKSPACE_ID="${NAME##*.}"

if [ "$WORKSPACE_ID" = "$CURRENT_WORKSPACE" ]; then
  # ACTIVE workspace - YELLOW highlight
  sketchybar --set "$NAME" \
    icon.color=$CRUST \
    background.color=$YELLOW \
    background.drawing=on
else
  # Inactive - just show the number, no background
  sketchybar --set "$NAME" \
    icon.color=$TEXT \
    background.drawing=off
fi
