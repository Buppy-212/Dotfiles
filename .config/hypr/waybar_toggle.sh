#!/usr/bin/env bash

ROUNDING=$(hyprctl getoption decoration:rounding | awk 'NR==1 {print $2 }')
if [ "$ROUNDING" -eq 3 ]; then
  hyprctl --batch "keyword general:gaps_in 0 ; keyword general:gaps_out 0 ; keyword general:border_size 0 ; keyword decoration:rounding 0"
  killall waybar
  waybar --config "$HOME"/.config/waybar/config_top.jsonc --style "$HOME"/.config/waybar/style_top.css
elif pidof waybar; then
  killall waybar
else
  hyprctl --batch "keyword general:gaps_in 2 ; keyword general:gaps_out 4 ; keyword general:border_size 2 ; keyword decoration:rounding 3"
  waybar --config "$HOME"/.config/waybar/config.jsonc --style "$HOME"/.config/waybar/style.css
fi
