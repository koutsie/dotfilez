#!/bin/bash
screen -dmS sowm /usr/bin/sowm &
exec /home/"$USER$"/Scripts/st.sh &
sleep infinity
