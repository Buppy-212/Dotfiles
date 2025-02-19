#!/usr/bin/env bash
ICONDIR="$HOME"/.config/rofi/icons/
ICONS=(Shutdown Reboot Logout Lock Hibernate Suspend)

declare -A actions
actions[Lock]="uwsm app -- hyprlock"
actions[Logout]="uwsm stop"
actions[Reboot]="systemctl reboot"
actions[Hibernate]="systemctl hibernate"
actions[Suspend]="systemctl suspend"
actions[Shutdown]="systemctl poweroff"

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
