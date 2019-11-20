#!/bin/bash
ran=$((1 + RANDOM % 66350))
now=$(date +%Y-%m-%d)
dunstify "Moving last wallpapper to /home/"$USER"/Wallpapers/"
cp /tmp/wall.jpg /home/"$USER"/Wallpapers/wal-"$now"-"$ran".jpg
dunstify "Done!"
