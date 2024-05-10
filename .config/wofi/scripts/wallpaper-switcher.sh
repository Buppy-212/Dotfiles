#!/bin/bash

# WALLPAPERS PATH
DIR=$HOME/Pictures/wallpapers/

PICS=($(find ${DIR} -maxdepth 2 | grep -e ".jpg$" -e ".jpeg$" -e ".png$"))

RANDOM_PIC=${PICS[$RANDOM % ${#PICS[@]}]}

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

	# random choice case
	if [ "$choice" = "img:$DIR/.ignore/random/random.jpg" ]; then
		hyprctl hyprpaper preload "${RANDOM_PIC}"
		hyprctl hyprpaper wallpaper "eDP-1,${RANDOM_PIC}"
		hyprctl hyprpaper unload all
		hyprctl hyprpaper preload "${RANDOM_PIC}"
		hyprctl hyprpaper wallpaper "HDMI-A-1,${RANDOM_PIC}"
		hyprctl hyprpaper unload all
		return
	fi

	new_pic=$(echo "$choice" | cut -d: -f 2)
	hyprctl hyprpaper preload "$new_pic"
	hyprctl hyprpaper wallpaper "eDP-1,$new_pic"
	hyprctl hyprpaper unload all
	hyprctl hyprpaper preload "$new_pic"
	hyprctl hyprpaper wallpaper "HDMI-A-1,$new_pic"
	hyprctl hyprpaper unload all
}

# Check if wofi is already running
if pidof wofi >/dev/null; then
	killall wofi
	exit 0
else
	main
fi
