#!/bin/bash
packet=$(ping -c 1 192.168.0.1 | grep "packet loss" | awk -F ',' '{print $3}' | awk '{print $1}')
echo "$packet"
