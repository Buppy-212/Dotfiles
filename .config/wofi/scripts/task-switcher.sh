#!/bin/bash

# Icon Theme
ICONDIR=$HOME/.local/share/icons/BeautyLine/apps/scalable/

# Get Task Info
readarray -t CLASS < <(hyprctl clients | grep class: | cut -d" " -f 2)
readarray -t WORKSPACE < <(hyprctl clients | grep workspace: | cut -d" " -f 2)
readarray -t ADDR < <(hyprctl clients | grep Window | cut -d" " -f 2)
readarray -t TITLE < <(hyprctl clients | grep title: | sed "s/title: //g")

# Wofi Command
CONFIG="$HOME/.config/wofi/taskconfig"
STYLE="$HOME/.config/wofi/style.css"

wofi_command="wofi  --conf $CONFIG --style $STYLE"

# Image and text for wofi
menu() {
	for i in "${!ADDR[@]}"; do
		printf "img:%s%s.svg:text:%s\t%s\t%s\n" "$ICONDIR" "${CLASS[$i],,}" "${TITLE[$i]}" "${WORKSPACE[$i]}" "${ADDR[$i]}"
	done
}

main() {
	# Wofi output
	choice=$(menu | ${wofi_command})
	workspace=$( echo "$choice" | cut -f 3 )
	window=$( echo "$choice" | cut -f 4)

	# Make choice the active task
	hyprctl dispatch focusworkspaceoncurrentmonitor "$workspace"
	hyprctl dispatch focuswindow address:0x"$window"
	hyprctl dispatch bringactivetotop address:0x"$window"
}

# Kill wofi if it is already running
if pidof wofi >/dev/null; then
	killall wofi
	exit 0
else
	main
fi
