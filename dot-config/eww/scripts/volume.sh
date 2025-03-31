#!/usr/bin/env dash

getVolume() {
  volume=$(pamixer --get-volume)
  mute=$(pamixer --get-mute)
  if [ "$volume" -eq "0" ] || "$mute"; then
    icon=" "
  elif [ "$volume" -ge "0" ] && [ "$volume" -le "30" ]; then
    icon=" "
  elif [ "$volume" -ge "30" ] && [ "$volume" -le "60" ]; then
    icon=" "
  elif [ "$volume" -ge "60" ]; then
    icon=" "
  fi
  printf "{\"volume\":\"%s\",\"icon\":\"%s\"}" "$volume" "$icon"
}

iDIR="$HOME/.config/mako/icons"

get_volume() {
  volume=$(pamixer --get-volume)
  echo "$volume"
}

get_icon() {
  current=$(get_volume)
  if [ "$current" -eq "0" ]; then
    echo "$iDIR/volume-mute.png"
  elif [ "$current" -ge "0" ] && [ "$current" -le "30" ]; then
    echo "$iDIR/volume-low.png"
  elif [ "$current" -ge "30" ] && [ "$current" -le "60" ]; then
    echo "$iDIR/volume-mid.png"
  elif [ "$current" -ge "60" ] && [ "$current" -le "100" ]; then
    echo "$iDIR/volume-high.png"
  fi
}

case "$1" in
"up")
  pamixer -i 5
  notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$(get_icon)" "Volume : $(get_volume) %"
  ;;
"down")
  pamixer -d 5
  notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$(get_icon)" "Volume : $(get_volume) %"
  ;;
"")
  getVolume
  ;;
*)
  pamixer --set-volume "$1"
  getVolume
  notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$(get_icon)" "Volume : $(get_volume) %"
  ;;
esac
