#!/bin/bash

swww query || swww init

DIR="$HOME/Pictures/wallpapers"
INDEX_FILE="/tmp/swww_wall_index"
mapfile -t PICS < <(find "$DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \) | sort)

TOTAL=${#PICS[@]}

# Read last index or default to -1
if [[ -f "$INDEX_FILE" ]]; then
    INDEX=$(<"$INDEX_FILE")
else
    INDEX=-1
fi

# Calculate next index
INDEX=$(( (INDEX + 1) % TOTAL ))

# Save index for next time
echo "$INDEX" > "$INDEX_FILE"

# Show the wallpaper
swww img "${PICS[$INDEX]}" --transition-type wipe --transition-fps 60 --transition-duration 1.5

