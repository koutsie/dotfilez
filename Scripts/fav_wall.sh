#!/bin/bash
# Minimal wallpaper saver, uses wallpapers saved with wallpaper.sh

ran=$((1 + RANDOM % 66350))
now=$(date +%Y-%m-%d)
notify-send "Saving favourite to Wallpapers"
cp /tmp/wall.jpg /home/"$USER"/Wallpapers/wal-"$now"-"$ran".jpg
notify-send "Done!"
