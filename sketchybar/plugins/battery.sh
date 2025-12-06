#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ -z "$PERCENTAGE" ]; then
  exit 0
fi

# More granular battery icons
if [ -n "$CHARGING" ]; then
  ICON=$ICON_BATTERY_CHARGING
  COLOR=$GREEN
elif [ "$PERCENTAGE" -ge 90 ]; then
  ICON=$ICON_BATTERY_100
  COLOR=$GREEN
elif [ "$PERCENTAGE" -ge 80 ]; then
  ICON=$ICON_BATTERY_90
  COLOR=$GREEN
elif [ "$PERCENTAGE" -ge 70 ]; then
  ICON=$ICON_BATTERY_80
  COLOR=$TEAL
elif [ "$PERCENTAGE" -ge 60 ]; then
  ICON=$ICON_BATTERY_70
  COLOR=$TEAL
elif [ "$PERCENTAGE" -ge 50 ]; then
  ICON=$ICON_BATTERY_60
  COLOR=$TEXT
elif [ "$PERCENTAGE" -ge 40 ]; then
  ICON=$ICON_BATTERY_50
  COLOR=$YELLOW
elif [ "$PERCENTAGE" -ge 30 ]; then
  ICON=$ICON_BATTERY_40
  COLOR=$YELLOW
elif [ "$PERCENTAGE" -ge 20 ]; then
  ICON=$ICON_BATTERY_30
  COLOR=$PEACH
elif [ "$PERCENTAGE" -ge 10 ]; then
  ICON=$ICON_BATTERY_20
  COLOR=$RED
else
  ICON=$ICON_BATTERY_10
  COLOR=$RED
fi

sketchybar --set "$NAME" \
  icon="$ICON" \
  icon.color="$COLOR" \
  label="${PERCENTAGE}%"
