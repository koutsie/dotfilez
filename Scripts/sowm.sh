#!/bin/bash
screen -dmS sowm /usr/bin/sowm &
dunstify "Welcome to sowm, $USER" 

sleep 10 && /home/"$USER"/Scripts/updates.sh 
/home/"$USER"/Scripts/getwall.sh
screen -dmS battmon /home/"$USER"/Scripts/battery.sh 

sleep infinity
