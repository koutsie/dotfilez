#!/bin/bash

ISMUTED=/tmp/.muted

if [ ! -e "$ISMUTED" ]; then
        touch "$ISMUTED"
        pamixer -m
        notify-send "audio" "Muted"
    else
        rm "$ISMUTED"
        pamixer -u
        notify-send "audio" "unmuted"
fi
