#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

if [ "$SENDER" = "front_app_switched" ]; then
  APP_NAME="$INFO"

  # Convert to Title Case (capitalize first letter of each word)
  TITLE_CASE=$(echo "$APP_NAME" | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2));}1')

  # Convert app name to icon format for sketchybar-app-font
  # Replace spaces with underscores and lowercase for icon lookup
  ICON_NAME=$(echo "$APP_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')

  sketchybar --set "$NAME" \
    label="$TITLE_CASE" \
    icon=":${ICON_NAME}:"
fi
