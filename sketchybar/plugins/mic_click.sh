#!/bin/bash

# Toggle mic mute
MIC_VOLUME=$(osascript -e 'input volume of (get volume settings)')

if [ "$MIC_VOLUME" -eq 0 ]; then
  osascript -e 'set volume input volume 100'
else
  osascript -e 'set volume input volume 0'
fi

# Update the icon
$HOME/.config/sketchybar/plugins/mic.sh
