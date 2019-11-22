#!/bin/sh
for (( ; ; ))
do
   sleep 5
   curl -s wttr.in/oulu?format=1 -o /tmp/weather.tmp
   sleep 600
done
