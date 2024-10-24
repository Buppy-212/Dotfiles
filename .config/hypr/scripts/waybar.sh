#!/usr/bin/env bash

BARS=("Top" "Left" "Left Float" "Bottom" "No Bar")
GAPS=("Gaps" "No Gaps")

GAPCHOICE=$(for a in "${GAPS[@]}"; do echo "$a" ; done | rofi -dmenu -config ~/.config/rofi/power.rasi -theme-str ' entry {placeholder: "Window Gaps";} listview {lines: 1; columns: 2;}')
case "$GAPCHOICE" in
  "No Gaps")
  hyprctl --batch "keyword general:gaps_in 0 ; keyword general:gaps_out 0 ; keyword general:border_size 0 ; keyword decoration:rounding 0"
  BARS=("Top" "Left" "Bottom" "No Bar")
    ;;
  "Gaps")
  hyprctl --batch "keyword general:gaps_in 2 ; keyword general:gaps_out 4 ; keyword general:border_size 2 ; keyword decoration:rounding 3"
  BARS=("Top" "Left Float" "Bottom" "No Bar")
    ;;
  *)
    exit 0
    ;;
esac

BARCHOICE=$(for a in "${BARS[@]}"; do echo "$a" ; done | rofi -dmenu -config ~/.config/rofi/power.rasi -theme-str ' entry {placeholder: "Waybar Position";} listview {lines: 2; columns: 2;}')
case "$BARCHOICE" in
  "Top")
  killall waybar
  waybar --config "$HOME"/.config/waybar/config_top.jsonc --style "$HOME"/.config/waybar/style_top.css
    ;;
  "Left Float")
  killall waybar
  waybar --config "$HOME"/.config/waybar/config.jsonc --style "$HOME"/.config/waybar/style.css
    ;;
  "Left")
  killall waybar
  waybar --config "$HOME"/.config/waybar/config_flat.jsonc --style "$HOME"/.config/waybar/style_flat.css
    ;;
  "Bottom")
  killall waybar
  waybar --config "$HOME"/.config/waybar/config_bottom.jsonc --style "$HOME"/.config/waybar/style_top.css
    ;;
  "No Bar")
  killall waybar
    ;;
  *)
    exit 0
    ;;
esac
