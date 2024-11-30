#!/usr/bin/env bash
MUSIC=$HOME/Music/Playlist/
case "$1" in
"")
  find "$MUSIC" -mindepth 1 | cut -d / -f 1-5 --complement
  ;;
*)
  coproc mpv "$MUSIC""$1"
  ;;
esac
