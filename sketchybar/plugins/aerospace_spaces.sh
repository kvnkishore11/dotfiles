#!/bin/bash

# Update all workspace highlights based on current Aerospace state

source "$HOME/.config/sketchybar/colors.sh"

# Get current focused workspace
FOCUSED=$(aerospace list-workspaces --focused 2>/dev/null)

# Get all non-empty workspaces
OCCUPIED=$(aerospace list-workspaces --monitor all --empty no 2>/dev/null)

# All possible workspaces we show
WORKSPACES="1 2 3 4 5 6 7 8 9 W C A"

for ws in $WORKSPACES; do
  if [ "$ws" = "$FOCUSED" ]; then
    # ACTIVE - Yellow highlight
    sketchybar --set space.$ws \
      icon.color=$CRUST \
      background.color=$YELLOW \
      background.drawing=on 2>/dev/null
  elif echo "$OCCUPIED" | grep -q "^${ws}$"; then
    # Has windows - visible
    sketchybar --set space.$ws \
      icon.color=$TEXT \
      background.drawing=off 2>/dev/null
  else
    # Empty - dimmed
    sketchybar --set space.$ws \
      icon.color=$OVERLAY0 \
      background.drawing=off 2>/dev/null
  fi
done
