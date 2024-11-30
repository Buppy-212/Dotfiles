#!/usr/bin/env bash
BOOKMARKS=$HOME/.local/state/bookmarks.txt
case "$1" in
"")
  cat "$BOOKMARKS" || touch "$BOOKMARKS"
  ;;
*)
  if grep -q -e "^$1$" "$BOOKMARKS"; then
    xdg-open "$1"
  else
    echo "$1" >>"$BOOKMARKS"
  fi
  ;;
esac
