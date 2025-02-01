#!/usr/bin/env dash

icon() {
  [ "$(cat /sys/class/net/enp2s0/operstate)" = up ] && icon="" && return
  [ "$(cat /sys/class/net/wlp3s0/operstate)" = up ] && icon="󰖩" && return
  icon="󰖪"
}
name() {
  name=$(nmcli | grep "^enp" | sed 's/\ connected\ to\ /Connected to /g' | cut -d ':' -f2) && return
  name=$(nmcli | grep "^wlp" | sed 's/\ connected\ to\ /Connected to /g' | cut -d ':' -f2)
}

icon
name
printf "{\"name\":\"%s\",\"icon\":\"%s\"}" "$name" "$icon"
