#!/bin/bash

# Icon Theme
ICONDIR=$HOME/.local/share/icons/BeautyLine/apps/scalable/

# Get Task Info
readarray -t CLASS < <(hyprctl clients | grep class: | cut -d" " -f 2)
readarray -t ADDR < <(hyprctl clients | grep Window | cut -d" " -f 2)
readarray -t TITLE < <(hyprctl clients | grep title: | sed "s/title: //g")

# Wofi Command
CONFIG="$HOME/.config/wofi/taskconfig"
STYLE="$HOME/.config/wofi/taskstyle.css"

wofi_command="wofi  --conf $CONFIG --style $STYLE"

# Image and text for wofi
menu() {
	for i in "${!ADDR[@]}"; do
		printf "img:%s%s.svg:text:%s\t%s\n" "$ICONDIR" "${CLASS[$i],,}" "${TITLE[$i]}" "${ADDR[$i]}"
	done
}

main() {
	# Wofi output
	choice=$(menu | ${wofi_command} | cut -f 3)

	# Make choice the active task
	hyprctl dispatch focuswindow address:0x"$choice"
	hyprctl dispatch bringactivetotop address:0x"$choice"
}

# Kill wofi if it is already running
if pidof wofi >/dev/null; then
	killall wofi
	exit 0
else
	main
fi
