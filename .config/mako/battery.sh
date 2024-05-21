#!/usr/bin/env bash
export "$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pgrep -u "$LOGNAME" gnome-session)/environ | tr '\0' '\n')"

BATTERY_PATH=$(upower -e | grep battery)
LINE_POWER_PATH=$(upower -e | grep line_power)
BATTERY_PERCENTAGE=$(upower -i "$BATTERY_PATH" | grep 'percentage:' | awk '{ print $2 }' | sed 's/%//')
CABLE_PLUGGED=$(upower -i "$LINE_POWER_PATH" | grep -A2 'line-power' | grep online | awk '{ print $2 }')

if [[ $CABLE_PLUGGED == 'yes' ]]; then

    if [[ "$BATTERY_PERCENTAGE" -gt 80 ]]; then
        notify-send --urgency=critical "Battery reached 80%" "Charging has stopped"
    fi

else

    if [[ "$BATTERY_PERCENTAGE" -lt 10 ]]; then
        notify-send --urgency=critical "Battery is below 10%" "Plug in the power cable"
    fi

fi

