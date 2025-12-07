#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

# Get memory info using vm_stat
PAGES_FREE=$(vm_stat | grep "Pages free" | awk '{print $3}' | tr -d '.')
PAGES_INACTIVE=$(vm_stat | grep "Pages inactive" | awk '{print $3}' | tr -d '.')
PAGES_SPECULATIVE=$(vm_stat | grep "Pages speculative" | awk '{print $3}' | tr -d '.')
PAGES_WIRED=$(vm_stat | grep "Pages wired" | awk '{print $4}' | tr -d '.')
PAGES_COMPRESSED=$(vm_stat | grep "Pages stored in compressor" | awk '{print $5}' | tr -d '.')
PAGES_ACTIVE=$(vm_stat | grep "Pages active" | awk '{print $3}' | tr -d '.')

# Calculate memory in GB (page size is 16384 bytes on Apple Silicon)
PAGE_SIZE=16384
TOTAL_MEM=$(sysctl -n hw.memsize)
TOTAL_GB=$((TOTAL_MEM / 1024 / 1024 / 1024))

# Used memory (active + wired + compressed)
USED_PAGES=$((PAGES_ACTIVE + PAGES_WIRED + PAGES_COMPRESSED))
USED_BYTES=$((USED_PAGES * PAGE_SIZE))
USED_GB=$((USED_BYTES / 1024 / 1024 / 1024))

# Calculate percentage
MEM_PERCENT=$((USED_GB * 100 / TOTAL_GB))

# Color based on usage
if [ "$MEM_PERCENT" -ge 80 ]; then
  COLOR=$RED
elif [ "$MEM_PERCENT" -ge 60 ]; then
  COLOR=$YELLOW
else
  COLOR=$SAPPHIRE
fi

sketchybar --set "$NAME" \
  icon="$ICON_RAM" \
  icon.color="$COLOR" \
  label="${USED_GB}/${TOTAL_GB}GB"
