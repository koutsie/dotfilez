#!/bin/bash
updates=$(yay -Qua | wc -l)
if [ "$updates" -eq 0 ]
then
      dunstify "Nothing to update!"
else
      dunstify "$updates availbe!"
fi

