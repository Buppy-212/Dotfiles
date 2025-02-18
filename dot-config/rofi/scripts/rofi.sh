#!/usr/bin/env bash
if pidof -q rofi; then
  killall rofi
  exit 0
else
  rofi -show "$1" -config "$HOME"/.config/rofi/"$2".rasi
fi
