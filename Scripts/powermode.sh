#!/bin/bash

#Set colours
Pink=''
Blue='\033[0;34m'
Red='\033[0;31m'
Color_Off='\033[0m'

select=$(printf "Select governor :\e[92m  [1]Powersave \e[93m [2]Performance \e[97m:")
# Read what governor the user wants

read -p "$select" CONDITION;

if [ "$CONDITION" == "1" ]; then
    	sudo cpupower frequency-set -g powersave 2!> /dev/null
    	governor=$(cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor | head -n 1)
    	printf "Governor:  \e[41m $governor \e[49m\n"
    exit
fi

if [ "$CONDITION" == "2" ]; then
    	sudo cpupower frequency-set -g performance 2!> /dev/null
    	governor=$(cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor | head -n 1)
    	printf "Governor:  \e[41m $governor \e[49m\n"
    exit
fi
