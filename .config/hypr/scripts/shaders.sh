#!/usr/bin/env bash
CURRENT=$(hyprctl getoption decoration:screen_shader | awk 'NR==1 {print $2}')
if [ "$CURRENT" = "[[EMPTY]]" ]; then
  hyprctl keyword decoration:screen_shader ~/.config/hypr/shaders/blue-light-filter.glsl
else
  hyprctl keyword decoration:screen_shader "[[EMPTY]]"
fi
