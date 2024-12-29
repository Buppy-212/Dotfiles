#!/usr/bin/env bash
BROWSER=zen-browser
BOOKMARKS=$HOME/.local/state/bookmarks.txt
case "$1" in
"")
  cat "$BOOKMARKS" || touch "$BOOKMARKS"
  ;;
"Window")
  coproc $BROWSER -new-window "$(cat /tmp/bookmark)"
  ;;
"Tab")
  coproc $BROWSER "$(cat /tmp/bookmark)"
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
