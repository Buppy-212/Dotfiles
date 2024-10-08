#!/usr/bin/env bash
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:drop_shadow 0;\
        keyword decoration:blur:enabled 0;\
        keyword decoration:rounding 0"
    exit
fi
hyprctl --batch "\
    keyword animations:enabled 1;\
    keyword decoration:drop_shadow 1;\
    keyword decoration:blur:enabled 1;\
    keyword decoration:rounding 3"
