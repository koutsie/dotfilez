#!/bin/bash
screen -dmS sowm /usr/bin/sowm
screen -dmS notifmon /usr/bin/dunst
screen -dmS wallpapermon /home/$USER/Scripts/wallpapermon.sh
screen -dmS redshift /usr/bin/redshift


exec /home/"$USER$"/Scripts/st.sh
sleep infinity
