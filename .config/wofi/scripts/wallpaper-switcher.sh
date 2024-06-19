#!/bin/bash

# WALLPAPERS PATH
DIR=$HOME/Pictures/wallpapers/

readarray -t PICS < <(find "${DIR}" -not -path '*/.*' | grep -e ".jpg$" -e ."jpeg$" -e ".png$")

RANDOM_PIC=${PICS[$RANDOM % ${#PICS[@]}]}

# WOFI STYLES
CONFIG="$HOME/.config/wofi/wallpaperconfig"
STYLE="$HOME/.config/wofi/style.css"

## Wofi Command
WOFI_COMMAND="wofi  --conf $CONFIG --style $STYLE"

menu() {
	printf "img:%s/.random.jpg\n" "$DIR"
	# Here we are looping in the PICS array that is composed of all images in the $DIR
	# folder
	for i in "${!PICS[@]}"; do
		printf "img:%s\n" "${PICS[$i]}"
	done

}

main() {
	CHOICE=$(menu | ${WOFI_COMMAND})

	# no choice case
	if [[ -z $CHOICE ]]; then return; fi

	NEW_PIC=$(echo "$CHOICE" | cut -d: -f 2)
	# random choice case
	if [ "$CHOICE" = "img:$DIR/.random.jpg" ]; then
		NEW_PIC="$RANDOM_PIC"
	fi

	ln -sf "$NEW_PIC" "$HOME"/.local/state/wallpaper
	killall hyprpaper
	hyprpaper
}

# Check if wofi is already running
if pidof wofi >/dev/null; then
	killall wofi
	exit 0
else
	main
fi
