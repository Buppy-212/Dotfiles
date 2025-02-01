#!/usr/bin/env dash

check() {
  AUR=$(yay -Qua | wc -l)
  OFFICIAL=$(checkupdates | wc -l)
  FLATPAK=$(flatpak remote-ls --updates | wc -l)
  echo $((OFFICIAL + AUR + FLATPAK)) >"$HOME"/.local/state/updates
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
  ghostty --title=update -e 'yay -Syu; flatpak update'
  check
  ;;
--check)
  check
  ;;
*)
  display
  ;;
esac
