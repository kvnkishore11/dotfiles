#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"
else
  VOLUME=$(osascript -e 'output volume of (get volume settings)')
fi

MUTED=$(osascript -e 'output muted of (get volume settings)')

if [ "$MUTED" = "true" ] || [ "$VOLUME" -eq 0 ]; then
  ICON=$ICON_VOLUME_MUTE
  COLOR=$OVERLAY0
elif [ "$VOLUME" -ge 66 ]; then
  ICON=$ICON_VOLUME_HIGH
  COLOR=$TEXT
elif [ "$VOLUME" -ge 33 ]; then
  ICON=$ICON_VOLUME_MID
  COLOR=$TEXT
else
  ICON=$ICON_VOLUME_LOW
  COLOR=$TEXT
fi

sketchybar --set "$NAME" \
  icon="$ICON" \
  icon.color="$COLOR" \
  label="${VOLUME}%"
