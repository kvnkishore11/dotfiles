#!/bin/bash

# Get window title using osascript
WINDOW_TITLE=$(osascript -e '
  tell application "System Events"
    set frontApp to first application process whose frontmost is true
    set frontAppName to name of frontApp
    tell process frontAppName
      try
        set windowTitle to name of front window
        return windowTitle
      on error
        return ""
      end try
    end tell
  end tell
' 2>/dev/null)

if [ -n "$WINDOW_TITLE" ]; then
  sketchybar --set "$NAME" label="$WINDOW_TITLE"
else
  sketchybar --set "$NAME" label=""
fi
