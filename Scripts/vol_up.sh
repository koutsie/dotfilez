#!/bin/bash
current=$(pamixer --get-volume)
pamixer -i 10
dunstify $current
