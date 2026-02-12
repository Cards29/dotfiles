#!/bin/bash

# Directory containing your wallpapers
WALLPAPER_DIR="$HOME/Pictures/wallpapers"

# Ensure swww-daemon is running
if ! pgrep -x "swww-daemon" > /dev/null; then
    swww-daemon &
    sleep 0.5 # Give it a moment to initialize
fi

# Pick a random wallpaper
RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Transition settings
# --transition-type: outer, center, any, wave, wipe, etc.
# --transition-pos: coordinates or corners like 'top-right'
swww img "$RANDOM_WALLPAPER" \
    --transition-type grow \
    --transition-pos top-right \
    --transition-duration 2 \
    --transition-fps 60

# Update symlink for hyprlock to track the current wallpaper
mkdir -p "$HOME/.cache"
ln -sf "$RANDOM_WALLPAPER" "$HOME/.cache/current_wallpaper"
