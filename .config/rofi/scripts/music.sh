#!/usr/bin/env bash
MUSIC=$HOME/Music/Playlist/
case "$1" in
"")
  echo "--Shuffle All--"
  find "$MUSIC" -mindepth 1 | cut -d / -f 1-5 --complement
  ;;
"--Shuffle All--")
  pkill mpv
  uwsm app -- mpv --shuffle "$MUSIC" &
  pkill rofi
  ;;
*)
  pkill mpv
  uwsm app -- mpv "$MUSIC""$1" --shuffle &
  pkill rofi
  ;;
esac
