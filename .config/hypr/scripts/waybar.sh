#!/usr/bin/env bash

case "$1" in
  "top")
  hyprctl --batch "keyword general:gaps_in 0 ; keyword general:gaps_out 0 ; keyword general:border_size 0 ; keyword decoration:rounding 0"
  killall waybar
  waybar --config "$HOME"/.config/waybar/config_top.jsonc --style "$HOME"/.config/waybar/style_top.css
    ;;
  "flat")
  hyprctl --batch "keyword general:gaps_in 0 ; keyword general:gaps_out 0 ; keyword general:border_size 0 ; keyword decoration:rounding 0"
  killall waybar
  waybar --config "$HOME"/.config/waybar/config_flat.jsonc --style "$HOME"/.config/waybar/style_flat.css
    ;;
  "normal")
  killall waybar
  hyprctl --batch "keyword general:gaps_in 2 ; keyword general:gaps_out 4 ; keyword general:border_size 2 ; keyword decoration:rounding 3"
  waybar --config "$HOME"/.config/waybar/config.jsonc --style "$HOME"/.config/waybar/style.css
    ;;
  "none")
  killall waybar
    ;;
  *)
  echo "Invalid option"
    ;;
esac
