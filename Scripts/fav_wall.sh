#!/bin/bash
# Minimal wallpaper saver, uses wallpapers saved with wallpaper.sh

ran=$((1 + RANDOM % 66350))
now=$(date +%Y-%m-%d)
dunstify "Copying last wallpapper to /home/"$USER"/Wallpapers/"
cp /tmp/wall.jpg /home/"$USER"/Wallpapers/wal-"$now"-"$ran".jpg
dunstify "Done!"
