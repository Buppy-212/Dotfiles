#!/usr/bin/env bash

if pidof waybar; then
  hyprctl --batch "keyword general:gaps_in 0 ; keyword general:gaps_out 0 ; keyword general:border_size 0 ; keyword decoration:rounding 0"
  killall waybar
else
  hyprctl --batch "keyword general:gaps_in 2 ; keyword general:gaps_out 4 ; keyword general:border_size 2 ; keyword decoration:rounding 3"
  waybar 
fi
