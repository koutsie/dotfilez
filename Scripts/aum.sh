#!/bin/bash

ISMUTED=/tmp/.muted

if [ ! -e "$ISMUTED" ]; then
    touch "$ISMUTED"
    pamixer -m
    dunstify "audio" "Muted"
else
    rm "$ISMUTED"
    pamixer -u
    dunstify "audio" "unmuted"
fi
