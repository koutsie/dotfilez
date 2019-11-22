#!/bin/bash
# AV volume helper
current=$(pamixer --get-volume)
volume=$(pamixer --get-volume-human)

pamixer -i 5 --allow-boost
dunstify --urgency=low $volume
