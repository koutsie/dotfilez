#!/bin/bash
current=$(pamixer --get-volume)
pamixer -d 15
dunstify $current
