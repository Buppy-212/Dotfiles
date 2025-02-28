#!/usr/bin/env dash

check() {
  {
    yay -Qua
    checkupdates
    flatpak remote-ls --updates
  } | wc -l >"$HOME"/.local/state/updates
  eww update updates="$(display)"
}

display() {
  COUNT=$(cat "$HOME"/.local/state/updates)
  if [ "$COUNT" = "0" ]; then
    printf "{\"tooltip\":\"Updated\",\"text\":\" \"}"
  else
    printf "{\"tooltip\":\"%s\",\"text\":\" \"}" "$COUNT"
  fi
}

case "$1" in
--update)
  kitty --title=specialtty -e sh -c "yay -Syu; flatpak update"
  check
  ;;
--check)
  check
  ;;
*)
  display
  ;;
esac
