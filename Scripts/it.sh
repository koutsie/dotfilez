#!/bin/bash
# This script is the initial script that is gonna be ran after sowm has been started.
# Feel free to uncomment the line below to enabled "custom boot animations".
#/home/"$USER"/Scripts/animation.sh &
#sleep 5
dunst &
sleep 1
/home/"$USER"/Scripts/getwall.sh &
screen -dmS wallpapermon /home/"$USER"/Scripts/wallpapermon.sh &
screen -dmS weathermon /home/"$USER"/Scripts/weather.sh &
screen -dmS redshift /usr/bin/redshift &
sleep 3
screen -dmS kdeconnectapp /usr/bin/kdeconnect-app &
notify-send "sowm" "Welcome, $USER!" &

