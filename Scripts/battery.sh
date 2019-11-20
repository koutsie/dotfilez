#!/bin/bash 

while :
do
   current=$(cat /sys/class/power_supply/BAT1/capacity)
   charging=$(cat /sys/class/power_supply/BAT1/status)

if [ "$charging" == "Charging" ]; then
        dunstify --urgency=critical --icon=battery-full-charged Charging...
fi

if [[ "$curdrent" -le "50" ]]; then
	dunstify --urgency=critical --icon=battery-caution $current%
fi

if [[ "$current" -ge "51" ]]; then
	dunstify  --urgency=critical --icon=battery-good $current%
fi

sleep 600
done
