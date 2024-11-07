#!/usr/bin/env bash

WORKSPACE=$(hyprctl activeworkspace | awk 'NR==1 {print $7}')
WORKSPACE=${WORKSPACE//:/}
grim -o "$WORKSPACE" - | swappy -f -
