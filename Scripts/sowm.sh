#!/bin/bash
screen -dmS sowm /usr/bin/sowm
screen -dmS wallpapermon /home/$USER/Scripts/wallpapermon.sh 
dunstify "Welcome to sowm, $USER" 

/home/"$USER"/Scripts/getwall.sh &
# polybar minimax -q 2>&1 1>/dev/null | while read OUTPUT; do dunstify -u critical "sowm" "$OUTPUT"; done &
sleep infinity
