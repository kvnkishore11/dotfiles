#!/bin/bash

# Enhanced workspace display with app icons
source "$HOME/.config/sketchybar/colors.sh"

# Get current focused workspace
FOCUSED=$(aerospace list-workspaces --focused 2>/dev/null)

# Get all non-empty workspaces
OCCUPIED=$(aerospace list-workspaces --monitor all --empty no 2>/dev/null)

# App icon mappings (sketchybar-app-font + nerd font fallbacks)
get_app_icon() {
  # Strip any invisible unicode characters for matching
  local app=$(echo "$1" | tr -d '[:cntrl:]' | sed 's/[^[:print:]]//g')
  case "$app" in
    *kitty*|*Terminal*|*iTerm*) echo ":kitty:" ;;
    *Chrome*) echo ":google_chrome:" ;;
    *Arc*) echo ":arc:" ;;
    *Safari*) echo ":safari:" ;;
    *Firefox*) echo ":firefox:" ;;
    *Code*|*VSCode*) echo ":visual_studio_code:" ;;
    *Slack*) echo ":slack:" ;;
    *Discord*) echo ":discord:" ;;
    *Spotify*) echo ":spotify:" ;;
    *Music*) echo ":music:" ;;
    *Notes*) echo ":notes:" ;;
    *Finder*) echo ":finder:" ;;
    *Preview*) echo ":preview:" ;;
    *Messages*) echo ":messages:" ;;
    *WhatsApp*) echo ":whats_app:" ;;
    *Telegram*) echo ":telegram:" ;;
    *Mail*) echo ":mail:" ;;
    *Calendar*) echo ":calendar:" ;;
    *Notion*) echo ":notion:" ;;
    *Figma*) echo ":figma:" ;;
    *Claude*) echo ":claude:" ;;
    *ChatGPT*) echo ":openai:" ;;
    *Cursor*) echo ":cursor:" ;;
    *Skim*|*PDF*) echo ":preview:" ;;
    *IntelliJ*|*IDEA*) echo ":intelli_j_idea:" ;;
    *WebStorm*) echo ":web_storm:" ;;
    *PyCharm*) echo ":py_charm:" ;;
    *Xcode*) echo ":xcode:" ;;
    *System*Preferences*|*System*Settings*) echo ":system_preferences:" ;;
    *Antigravity*) echo ":default:" ;;
    *) echo "" ;;
  esac
}

# All possible workspaces (numbers + letters)
WORKSPACES="1 2 3 4 5 W C A D E M N P V"

for ws in $WORKSPACES; do
  # Get windows in this workspace - use awk for robust parsing
  WINDOWS=$(aerospace list-windows --workspace "$ws" 2>/dev/null | awk -F'|' '{gsub(/^[[:space:]]+|[[:space:]]+$/, "", $2); print $2}')

  # Build app icons string (unlimited)
  APP_ICONS=""
  while IFS= read -r app; do
    if [ -n "$app" ]; then
      APP_ICON=$(get_app_icon "$app")
      if [ -n "$APP_ICON" ]; then
        APP_ICONS="${APP_ICONS}${APP_ICON}"
      fi
    fi
  done <<< "$WINDOWS"

  if [ "$ws" = "$FOCUSED" ]; then
    # ACTIVE workspace - highlighted
    sketchybar --set space.$ws \
      icon.color=$CRUST \
      label="$APP_ICONS" \
      label.drawing=on \
      label.color=$CRUST \
      background.color=$YELLOW \
      background.drawing=on 2>/dev/null
  elif echo "$OCCUPIED" | grep -q "^${ws}$"; then
    # Has windows - show with icons
    sketchybar --set space.$ws \
      icon.color=$TEXT \
      label="$APP_ICONS" \
      label.drawing=on \
      label.color=$SUBTEXT0 \
      background.drawing=off 2>/dev/null
  else
    # Empty workspace - dimmed, no icons
    sketchybar --set space.$ws \
      icon.color=$OVERLAY0 \
      label="" \
      label.drawing=off \
      background.drawing=off 2>/dev/null
  fi
done
