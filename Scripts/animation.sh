#!/bin/bash
# Tchooses a random boot animation!
cd /home/$USER/sounds/
pamixer --set-volume 50
animation=$(ls | shuf -n1)
mpv --fs "$animation"
