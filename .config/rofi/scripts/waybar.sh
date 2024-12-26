#!/usr/bin/env bash
OPTS=("Gaps" "Big Gaps" "No Gaps")
case "$1" in
"No Gaps")
  hyprctl -q --batch "keyword general:gaps_in 0 ; keyword general:gaps_out 0 ; keyword general:border_size 0 ; keyword decoration:rounding 0"
  OPTS=("Top" "Left" "Bottom" "No Bar")
  ;;
"Gaps")
  hyprctl -q --batch "keyword general:gaps_in 2 ; keyword general:gaps_out 4 ; keyword general:border_size 2 ; keyword decoration:rounding 3"
  OPTS=("Top" "Left Float" "Bottom" "No Bar")
  ;;
"Big Gaps")
  hyprctl -q --batch "keyword general:gaps_in 4 ; keyword general:gaps_out 8 ; keyword general:border_size 2 ; keyword decoration:rounding 3"
  OPTS=("Top" "Left Alt" "Bottom" "No Bar")
  ;;
"Top")
  killall waybar
  hyprctl -q dispatch exec waybar --config "$HOME"/.config/waybar/config_top.jsonc --style "$HOME"/.config/waybar/style_top.css
  OPTS=()
  ;;
"Left Float")
  killall waybar
  hyprctl -q dispatch exec waybar --config "$HOME"/.config/waybar/config.jsonc --style "$HOME"/.config/waybar/style.css
  OPTS=()
  ;;
"Left Alt")
  killall waybar
  hyprctl -q dispatch exec waybar --config "$HOME"/.config/waybar/config_s.jsonc --style "$HOME"/.config/waybar/style.css
  OPTS=()
  ;;
"Left")
  killall waybar
  hyprctl -q dispatch exec waybar --config "$HOME"/.config/waybar/config_flat.jsonc --style "$HOME"/.config/waybar/style_flat.css
  OPTS=()
  ;;
"Bottom")
  killall waybar
  hyprctl -q dispatch exec waybar --config "$HOME"/.config/waybar/config_bottom.jsonc --style "$HOME"/.config/waybar/style_top.css
  OPTS=()
  ;;
"No Bar")
  killall waybar
  OPTS=()
  ;;
esac
for i in "${OPTS[@]}"; do
  echo -en "$i\n"
done
