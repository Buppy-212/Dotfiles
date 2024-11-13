#!/usr/bin/env bash
DIR="$HOME"/Pictures/Wallpapers/
get() {
  readarray -t PICS < <(find "$HOME"/Pictures/Wallpapers/ | grep -e ".png$")
  for a in "${PICS[@]}"; do
    echo -en "$a\0icon\x1f$a\n"
  done 
}
change() {
	NEW_PIC=${CHOICE/\.\//"$DIR"}
	ln -sf "$NEW_PIC" "$HOME"/.local/state/wallpaper
	killall hyprpaper
	hyprpaper
}
case "$1" in
  "")
    get
    ;;
  *)
    change
    ;;
esac

