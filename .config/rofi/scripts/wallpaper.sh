#!/usr/bin/env bash
DIR="$HOME"/Pictures/Wallpapers/
get() {
  readarray -t PICS < <(find "$HOME"/Pictures/Wallpapers/ | grep -e ".png$" -e ".jpg$" -e ".jpeg$" -e ".webp$")
  for a in "${PICS[@]}"; do
    echo -en "$a\0icon\x1f$a\n"
  done
}
change() {
  NEW_PIC=${1/\.\//"$DIR"}
  ln -sf "$NEW_PIC" "$HOME"/.local/state/wallpaper
  cp "$NEW_PIC" /usr/share/nwg-hello/wallpaper
  killall hyprpaper
  uwsm app -S out -- hyprpaper &
  pkill rofi
}
case "$1" in
"")
  get
  ;;
*)
  change "$@"
  ;;
esac
