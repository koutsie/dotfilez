#!/bin/bash
# AV volume helper
current=$(pamixer --get-volume)
volume=$(pamixer --get-volume-human)

pamixer -i 2 --allow-boost
notify-send --urgency=low $volume
