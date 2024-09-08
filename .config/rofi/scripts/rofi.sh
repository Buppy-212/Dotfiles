# Check if rofi is already running
if pidof rofi >/dev/null; then
	killall rofi
	exit 0
else
	rofi -show drun
fi
