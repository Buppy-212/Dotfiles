#!/usr/bin/env bash
if pidof rofi >/dev/null; then
  killall rofi
  exit 0
else
  rofi -show "$1" -config "$HOME"/.config/rofi/"$2".rasi
fi
