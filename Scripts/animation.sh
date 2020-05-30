#!/bin/bash
# This chooses a random animation to show when sowm starts. Uses mpv and pamixer.
cd /home/$USER/sounds/
pamixer --set-volume 40 
animation=$(ls | shuf -n1)
mpv --fs "$animation"
