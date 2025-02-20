#!/usr/bin/env bash
ICONDIR="$HOME"/.config/rofi/icons/
ICONS=(Shutdown Reboot Logout Lock Suspend Hibernate)

declare -A actions
actions[Shutdown]="systemctl poweroff"
actions[Reboot]="systemctl reboot"
actions[Logout]="uwsm stop"
actions[Lock]="uwsm app -- hyprlock"
actions[Suspend]="systemctl suspend"
actions[Hibernate]="systemctl hibernate"

case "$1" in
"")
  for a in "${ICONS[@]}"; do
    path="$ICONDIR$a.png"
    echo -en "$a\0icon\x1f$path\n"
  done
  ;;
*)
  pkill rofi
  ${actions["$1"]}
  ;;
esac
