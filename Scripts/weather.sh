#!/bin/sh
# This script handles getting the weather and caching it for later use so we dont overload the wttr.in server with out requests every time we change a wallpaper.

for (( ; ; ))
do
   sleep 5
   curl -s wttr.in/oulu?format=1 -o /tmp/weather.tmp
   sleep 600
done
