#!/bin/bash

# WALLPAPERS PATH
DIR=$HOME/Pictures/wallpapers/

PICS=($(find ${DIR} -maxdepth 2 | grep -e ".jpg$" -e ".jpeg$" -e ".png$"))

RANDOM_PIC=${PICS[$RANDOM % ${#PICS[@]}]}

# Hyprpaper config file
HYPRPAPER="$HOME/.config/hypr/hyprpaper.conf"
# WOFI STYLES
CONFIG="$HOME/.config/wofi/wallpaperconfig"
STYLE="$HOME/.config/wofi/style.css"

## Wofi Command
wofi_command="wofi  --conf $CONFIG --style $STYLE"

menu() {
	printf "img:%s/.ignore/random/random.jpg\n" "$DIR"
	# Here we are looping in the PICS array that is composed of all images in the $DIR
	# folder
	for i in "${!PICS[@]}"; do
		printf "img:%s\n" "${PICS[$i]}"
	done

}

main() {
	choice=$(menu | ${wofi_command})

	# no choice case
	if [[ -z $choice ]]; then return; fi

	NEW_PIC=$(echo "$choice" | cut -d: -f 2)
	# random choice case
	if [ "$choice" = "img:$DIR/.ignore/random/random.jpg" ]; then
		NEW_PIC="$RANDOM_PIC"
	fi

	killall hyprpaper
	printf "preload = %s \nwallpaper = ,%s \nsplash = false \nipc = false " "${NEW_PIC}" "${NEW_PIC}" >"$HYPRPAPER"
	hyprpaper
}

# Check if wofi is already running
if pidof wofi >/dev/null; then
	killall wofi
	exit 0
else
	main
fi
