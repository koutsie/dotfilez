#!/bin/sh
current=$(cat /sys/class/power_supply/BAT1/capacity)
charging=$(cat /sys/class/power_supply/BAT1/status)

if [[ "$charging" == "Charging" ]]; then
	echo "[AC] $current%"
else
	echo "$current%"
fi
