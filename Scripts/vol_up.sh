#!/bin/bash
current=$(pamixer --get-volume)
pamixer -i 15
dunstify $current
