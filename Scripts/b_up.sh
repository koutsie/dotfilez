#!/bin/bash
current=$(cat /sys/class/backlight/amdgpu_bl0/brightness)   
new=$((current + 25))   
echo $new > /sys/class/backlight/amdgpu_bl0/brightness
dunstify $new
