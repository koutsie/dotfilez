#!/bin/sh
for (( ; ; ))
do
   curl -s wttr.in/oulu?format=1 -o /tmp/weather.tmp
   sleep 600
done
