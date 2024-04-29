#!/bin/bash
# Check if wofi is already running
if pidof wofi >/dev/null; then
	killall wofi
	exit 0
else
	wofi
fi
