#!/bin/bash 
# Minimal battery notifier
# TODO: Add chargin detection & make this easier to read, it hurst my eyes.
while :
do
    current=$(cat /sys/class/power_supply/BAT1/capacity)
    charging=$(cat /sys/class/power_supply/BAT1/status)
    
		if [[ "$curdrent" -ge "50" ]]; then
				dunstify --icon=battery-good $current% --timeout=50000
			
		else 
			if [[ "$curdrent" -le "49" ]]; then
				dunstify --icon=battery-caution $current% --timeout=5000
			fi
		fi

    sleep 600
    
done
