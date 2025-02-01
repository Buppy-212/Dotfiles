#!/usr/bin/env bash
get() {
  HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
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
  if pidof -q hyprsunset; then
    echo "Filter Off"
  else
    echo "Filter On"
  fi
}
case "$1" in
"")
  get
  ;;
"Idle Off")
  pkill hypridle
  ;;
"Idle On")
  uwsm app -S out -- hypridle &
  pkill rofi
  ;;
"Gamemode Off")
  hyprctl -q --batch "\
      keyword animations:enabled 1;\
      keyword decoration:drop_shadow 1;\
      keyword decoration:blur:enabled 1;\
      keyword decoration:rounding 3;\
      keyword general:gaps_in 2;\
      keyword general:border_size 2;\
      keyword general:gaps_out 4"
  ;;
"Gamemode On")
  hyprctl -q --batch "\
      keyword animations:enabled 0;\
      keyword decoration:drop_shadow 0;\
      keyword decoration:blur:enabled 0;\
      keyword decoration:rounding 0;\
      keyword general:gaps_in 0;\
      keyword general:border_size 0;\
      keyword general:gaps_out 0"
  ;;
"Filter Off")
  pkill hyprsunset
  ;;
"Filter On")
  uwsm app -S out -- hyprsunset -t 4000 &
  pkill rofi
  ;;
esac
