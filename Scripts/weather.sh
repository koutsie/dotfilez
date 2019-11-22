#!/bin/sh
for (( ; ; ))
do
   curl -s wttr.in/oulu?format=1 > /tmp/weather.tmp
   sleep 600
done
