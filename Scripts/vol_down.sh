#!/bin/bash
current=$(pamixer --get-volume)
pamixer -d 10
dunstify $current
