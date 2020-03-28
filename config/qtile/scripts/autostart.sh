#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}


setxkbmap -layout fi

run nm-applet &
run pamac-tray &
run xfce4-power-manager &
numlockx on &
blueberry-tray &
picom --config $HOME/.config/qtile/scripts/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &

pulseeffects --gapplication-service &
run volumeicon &
run discord &
run firefox &
run kdeconnect-indicator &
redshift-gtk &
run feh --bg-fill "/home/koutsie/aaple.png"
