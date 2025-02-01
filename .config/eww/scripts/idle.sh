#!/usr/bin/env dash

case "$1" in
--toggle)
  if pidof -q hypridle; then
    pkill hypridle
    eww update idle=" "
  else
    uwsm app -- hypridle &
    eww update idle=" "
  fi
  ;;
*)
  if pidof -q hypridle; then
    echo " "
  else
    echo " "
  fi
  ;;
esac
