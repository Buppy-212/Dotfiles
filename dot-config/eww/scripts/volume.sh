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

case "$1" in
"up")
  pamixer -i 5
  ;;
"down")
  pamixer -d 5
  ;;
*)
  getVolume
  ;;
esac
