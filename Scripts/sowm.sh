#!/bin/bash
exec /usr/bin/sowm
dunstify "Welcome to sowm, $USER"
exec /home/"$USER"/Scripts/updates.sh
