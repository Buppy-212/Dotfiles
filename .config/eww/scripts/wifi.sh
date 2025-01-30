#!/usr/bin/env dash

symbol() {
  [ "$(cat /sys/class/net/enp2s0/operstate)" = up ] && echo "" && exit
  [ "$(cat /sys/class/net/wlp3s0/operstate)" = up ] && echo "󰖩" && exit
  echo "󰖪"
}

name() {
  nmcli | grep "^enp" | sed 's/\ connected\ to\ /Connected to /g' | cut -d ':' -f2 && exit
  nmcli | grep "^wlp" | sed 's/\ connected\ to\ /Connected to /g' | cut -d ':' -f2
}

[ "$1" = "icon" ] && symbol && exit
[ "$1" = "name" ] && name && exit
