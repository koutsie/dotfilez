#!/bin/bash
dunst &

/home/"$USER"/Scripts/getwall.sh &

dunstify "sowm" "Welcome back, $USER"

/home/"$USER"/Scripts/wallpapermon.sh &
