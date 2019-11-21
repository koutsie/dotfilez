#!/bin/bash
screen -dmS sowm /usr/bin/sowm &
dunstify "Welcome to sowm, $USER" 

/home/"$USER"/Scripts/getwall.sh
polybar minimax -q
sleep infinity
