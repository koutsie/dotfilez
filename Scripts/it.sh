#!/bin/bash
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
screen -dmS pbih /usr/bin/plasma-browser-integration-host &
dunstify "sowm" "Welcome, $USER!" &

