#!/bin/bash
savelocation=/tmp/wall.jpg
statslocation=/tmp/wall-stats.jpg

while :
do
   battery=$(cat /sys/class/power_supply/BAT1/capacity)
   weather=$(cat /tmp/weather.tmp)
   date=$(date +"%H:%M")
   convert -pointsize 48 -fill white -annotate +1200+1000 "$weather | $date | $battery%" "$savelocation" "$statslocation"
   feh --bg-fill "$statslocation"
   sleep 60
done

