#!/usr/bin/env dash

case "$1" in
--toggle)
  if pidof -q hyprsunset; then
    pkill hyprsunset
    eww update filter=" "
  else
    uwsm app -- hyprsunset -t 2500 &
    eww update filter=" "
  fi
  ;;
*)
  if pidof -q hyprsunset; then
    echo " "
  else
    echo " "
  fi
  ;;
esac
