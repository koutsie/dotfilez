#!/bin/bash
# AV volume helper
current=$(pamixer --get-volume)
volume=$(pamixer --get-volume-human)

pamixer -i 10
dunstify $volume
