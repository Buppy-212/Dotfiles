#!/usr/bin/env bash
MUSIC=$HOME/Music/Playlist/
case "$1" in
"")
  echo "--Shuffle All--"
  find "$MUSIC" -mindepth 1 | cut -d / -f 1-5 --complement
  ;;
"--Shuffle All--")
  pkill mpv
  coproc mpv --shuffle "$MUSIC"
  ;;
*)
  pkill mpv
  coproc mpv "$MUSIC""$1" --shuffle
  ;;
esac
