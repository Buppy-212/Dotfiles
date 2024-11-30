#!/usr/bin/env bash
MUSIC=$HOME/Music/Playlist/
case "$1" in
"")
  find "$MUSIC" -mindepth 1 | cut -d / -f 1-5 --complement
  ;;
*)
  pkill mpv
  coproc mpv "$MUSIC""$1" --shuffle
  ;;
esac
