#!/usr/bin/env bash
if pidof hypridle; then
  killall hypridle
  notify-send Hypridle Off
else
  hypridle & disown
  notify-send Hypridle On
fi
