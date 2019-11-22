#!/bin/bash
# This script changes to one of the wallpapers already downloaded with wallpaper.sh
cd /home/$USER/Wallpapers/

wallpaper=$(ls | shuf -n1)
cp $wallpaper /tmp/wall.jpg
feh --bg-fill "$wallpaper"
