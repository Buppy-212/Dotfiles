#!/bin/bash

# Icon Theme
ICONDIR=$HOME/.local/share/icons/BeautyLine/apps/scalable/

# Wofi Command
CONFIG="$HOME/.config/wofi/taskconfig"
STYLE="$HOME/.config/wofi/style.css"
WOFI_COMMAND="wofi  --conf $CONFIG --style $STYLE"

# Get Task Info
tasks(){
  readarray -t CLASS < <(hyprctl clients | grep class: | cut -d" " -f 2)
  readarray -t WORKSPACE < <(hyprctl clients | grep workspace: | cut -d" " -f 2)
  readarray -t ADDR < <(hyprctl clients | grep Window | cut -d" " -f 2)
  readarray -t TITLE < <(hyprctl clients | grep title: | sed "s/title: //g")
}

# Image and text for wofi
menu() {
	for i in "${!ADDR[@]}"; do
		printf "img:%s%s.svg:text:%s\t%s\t%s\n" "$ICONDIR" "${CLASS[$i],,}" "${TITLE[$i]}" "${WORKSPACE[$i]}" "${ADDR[$i]}"
	done
}

main(){
  tasks

  # Wofi output
  choice=$(menu | ${WOFI_COMMAND})
  workspace=$( echo "$choice" | cut -f 3 )
  window=$( echo "$choice" | cut -f 4)

  # Break condition
  if [ -z "$choice" ]; then
    return
  fi

  # Make choice the active task
  if [ "$1" = "switch" ]; then
    hyprctl dispatch focusworkspaceoncurrentmonitor "$workspace"
    hyprctl dispatch focuswindow address:0x"$window"
    hyprctl dispatch bringactivetotop address:0x"$window"
  fi
  
  # Kill the window
  if [ "$1" = "kill" ]; then
    hyprctl dispatch closewindow address:0x"$window"
    sleep 0.1 # So the window fully closes
    main "$1"
  fi
}

# Kill wofi if it is already running
if pidof wofi >/dev/null; then
	killall wofi
	exit 0
else
  main "$1"
fi
