#!/bin/bash

# Icon Theme
ICONDIR=$HOME/.local/share/icons/BeautyLine/apps/scalable/

# Wofi Command
CONFIG="$HOME/.config/wofi/taskconfig"
STYLE="$HOME/.config/wofi/style.css"
WOFI_COMMAND="wofi  --conf $CONFIG --style $STYLE"

# Get Task Info
tasks(){
  readarray -t CLASS < <(hyprctl clients | awk 'NR%23==9  {print $2}')
  readarray -t WORKSPACE < <(hyprctl clients | awk 'NR%23==6  {print $2}')
  readarray -t ADDR < <(hyprctl clients | awk 'NR%23==1  {print $2}')
  readarray -t TITLE < <(hyprctl clients | awk 'NR%23==10 {s = ""; for (i = 2; i <= NF; i++) s = s $i " "; print s}')
}

# Image and text for wofi
menu() {
	for i in "${!ADDR[@]}"; do
		printf "img:%s%s.svg:text:\t%s\t%s\t%s\n" "$ICONDIR" "${CLASS[$i],,}" "${TITLE[$i]}" "${WORKSPACE[$i]}" "${ADDR[$i]}"
	done
}

main(){
  tasks
  if [ "${ADDR[0]}" = "request" ]; then
    return
  fi

  # Wofi output
  CHOICE=$(menu | ${WOFI_COMMAND})
  SPACE=$( echo "$CHOICE" | cut -f 3 )
  WINDOW=$( echo "$CHOICE" | cut -f 4)

  # Break condition
  if [ -z "$CHOICE" ]; then
    return
  fi

  # Make choice the active task
  if [ "$1" = "switch" ]; then
    hyprctl dispatch focusworkspaceoncurrentmonitor "$SPACE"
    hyprctl dispatch focuswindow address:0x"$WINDOW"
    hyprctl dispatch bringactivetotop address:0x"$WINDOW"
  fi
  
  # Kill the window
  if [ "$1" = "kill" ]; then
    hyprctl dispatch closewindow address:0x"$WINDOW"
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
