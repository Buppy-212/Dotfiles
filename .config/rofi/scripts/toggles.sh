#!/usr/bin/env bash
get() {
  HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
  SHADER=$(hyprctl getoption decoration:screen_shader | awk 'NR==1 {print $2}')
  if pidof -q hypridle; then
    echo "Idle Off"
  else
    echo "Idle On"
  fi
  if [ "$HYPRGAMEMODE" = 1 ]; then
    echo "Gamemode On"
  else
    echo "Gamemode Off"
  fi
  if [ "$SHADER" = "[[EMPTY]]" ]; then
    echo "Filter On"
  else
    echo "Filter Off"
  fi
}
case "$1" in
"")
  get
  ;;
"Idle Off")
  killall hypridle
  ;;
"Idle On")
  uwsm app -S out -- hypridle &
  ;;
"Gamemode Off")
  hyprctl -q --batch "\
      keyword animations:enabled 1;\
      keyword decoration:drop_shadow 1;\
      keyword decoration:blur:enabled 1;\
      keyword decoration:rounding 3"
  ;;
"Gamemode On")
  hyprctl -q --batch "\
      keyword animations:enabled 0;\
      keyword decoration:drop_shadow 0;\
      keyword decoration:blur:enabled 0;\
      keyword decoration:rounding 0"
  ;;
"Filter Off")
  hyprctl -q keyword decoration:screen_shader "[[EMPTY]]"
  ;;
"Filter On")
  hyprctl -q keyword decoration:screen_shader ~/.config/hypr/shaders/blue-light-filter.glsl
  ;;
esac
