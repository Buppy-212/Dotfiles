#!/usr/bin/env bash
BROWSER="uwsm app -- zen-browser"
BOOKMARKS=$HOME/.local/state/bookmarks.txt
case "$1" in
"")
  cat "$BOOKMARKS" || touch "$BOOKMARKS"
  ;;
"Window")
  $BROWSER -new-window "$(cat /tmp/bookmark)" &
  pkill rofi
  ;;
"Tab")
  $BROWSER "$(cat /tmp/bookmark)" &
  pkill rofi
  ;;
*)
  if grep -q -e "^$1$" "$BOOKMARKS"; then
    echo "Tab"
    echo "Window"
    echo "$1" >/tmp/bookmark
  else
    echo "$1" >>"$BOOKMARKS"
  fi
  ;;
esac
