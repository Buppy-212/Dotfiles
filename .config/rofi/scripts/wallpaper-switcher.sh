#!/bin/bash

# WALLPAPERS PATH
cd "$HOME"/Pictures/Wallpapers/ || exit
readarray -t PICS < <(find . | grep -e ".png$")

main() {
  CHOICE=$(for a in "${PICS[@]}"; do echo -en "$a\0icon\x1f$a\n" ; done | rofi -config ~/.config/rofi/wallpaper.rasi -dmenu )

	# no choice case
	if [[ -z $CHOICE ]]; then return; fi

	NEW_PIC=$(echo "$CHOICE" | cut -d: -f 2)

	ln -sf "$NEW_PIC" "$HOME"/.local/state/wallpaper
	killall hyprpaper
	hyprpaper
}

# Check if rofi is already running
if pidof rofi >/dev/null; then
	killall rofi
	exit 0
else
	main
fi
