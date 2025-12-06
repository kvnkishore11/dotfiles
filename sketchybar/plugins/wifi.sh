#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

# Modern macOS WiFi detection using multiple methods
SSID=""
IP=""

# Method 1: Try system_profiler (most reliable on modern macOS)
WIFI_DATA=$(system_profiler SPNetworkDataType 2>/dev/null | grep -A15 "Wi-Fi:" | head -20)
IP=$(echo "$WIFI_DATA" | grep "IPv4 Addresses:" | awk '{print $3}')

# Method 2: Try networksetup
if [ -z "$IP" ]; then
  SSID=$(networksetup -getairportnetwork en0 2>/dev/null | awk -F': ' '{print $2}')
fi

# Method 3: Check if we have an IP via ipconfig
if [ -z "$IP" ]; then
  IP=$(ipconfig getifaddr en0 2>/dev/null)
fi

# Determine connection status
if [ -n "$IP" ] || [ -n "$SSID" ]; then
  # Connected - get SSID if we don't have it
  if [ -z "$SSID" ]; then
    SSID="WiFi"
  fi
  ICON=$ICON_WIFI
  COLOR=$SAPPHIRE
  LABEL="$SSID"
else
  ICON=$ICON_WIFI_OFF
  COLOR=$OVERLAY0
  LABEL="Off"
fi

sketchybar --set "$NAME" \
  icon="$ICON" \
  icon.color="$COLOR" \
  label="$LABEL"
