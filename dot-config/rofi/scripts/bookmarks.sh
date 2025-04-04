#!/usr/bin/env dash
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
"Delete")
  mv "$BOOKMARKS" "$BOOKMARKS".bak
  grep --invert-match "$(cat /tmp/bookmark)" "$BOOKMARKS".bak >"$BOOKMARKS"
  cat "$BOOKMARKS"
  ;;
*)
  if grep -q -e "^$1$" "$BOOKMARKS"; then
    echo "Tab"
    echo "Window"
    echo "Delete"
    echo "$1" >/tmp/bookmark
  else
    echo "$1" >>"$BOOKMARKS"
    sort "$BOOKMARKS" >"$BOOKMARKS".new
    mv "$BOOKMARKS".new "$BOOKMARKS"
  fi
  ;;
esac
