#!/bin/bash
screen -dmS sowm /usr/bin/sowm &
dunstify "Welcome to sowm, $USER" 

/home/"$USER"/Scripts/updates.sh 
/home/"$USER"/Scripts/wallpaper.sh 
/home/"$USER"/Scripts/updates.sh 
screen -dmS battmon /home/"$USER"/Scripts/battery.sh 

sleep infinity
