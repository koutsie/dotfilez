#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# Note, update keyboard map here
setxkbmap -layout fi

run nm-applet &
run pamac-tray &
run xfce4-power-manager &
# Disabled by default
# numlockx on &

blueberry-tray &
picom --config $HOME/.config/qtile/scripts/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &

# Pulseeffects is now disabled by default when running qTile because of fuck you
# pulseeffects --gapplication-service &
run volumeicon &
# Fuck discord
#run discord &

# You might want to disable this idk.
run kdeconnect-indicator &
redshift-gtk &
