#!/bin/bash
dunst &
dunstify "sowm" "Welcome back, $USER" &
/home/"$USER"/Scripts/getwall.sh &
sleep 10
screen -dmS wallpapermon /home/"$USER"/Scripts/wallpapermon.sh &
dunstify "sowm" "Wallpapermon started." &
screen -dmS weathermon /home/"$USER"/Scripts/weather.sh &
dunstify "sowm" "Weathermon started." &
screen -dmS redshift /usr/bin/redshift &
dunstify "sowm" "Redshift started" &
screen -dmS kdeconnectapp /usr/bin/kdeconnect-app &
dunstify "sowm" "Kdeconnect started" &
screen -dmS pbih /usr/bin/plasma-browser-integration-host &
dunstify "sowm" "Plasma browser integration started" &

