#!/usr/bin/env dash

case "$1" in
--update)
  ghostty --title=Update -e 'yay -Syu; flatpak update'
  echo "0" >"$HOME"/.local/state/updates
  eww update updates="{\"tooltip\":\"Updated\",\"text\":\" \"}"
  ;;
--check)
  AUR=$(yay -Qua | wc -l)
  OFFICIAL=$(checkupdates | wc -l)
  FLATPAK=$(flatpak remote-ls --updates | wc -l)
  echo $((OFFICIAL + AUR + FLATPAK)) >"$HOME"/.local/state/updates
  ;;
*)
  COUNT=$(cat "$HOME"/.local/state/updates)
  if [ "$COUNT" = "0" ]; then
    printf "{\"tooltip\":\"Updated\",\"text\":\" \"}"
  else
    printf "{\"tooltip\":\"%s\",\"text\":\" \"}" "$COUNT"
  fi
  exit 0
  ;;
esac
