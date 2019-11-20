#!/bin/bash

# Minimalistic random wallpaper downloader, uses unsplash as source because they seem to have the best wallpapers.
# I guess i could add an favourites option later on but for now it works for me-
# Requirements: 
#              feh, wget, imlib2
savelocation=/tmp/wall.jpg
imgprovider=https://source.unsplash.com/1920x1080/?nature,trees

wget -N  "$imgprovider" -O "$savelocation" 2> /dev/null
feh --bg-fill "$savelocation"

dunstify "New wallpaper set!"
