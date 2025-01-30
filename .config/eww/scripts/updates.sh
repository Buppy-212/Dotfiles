#!/usr/bin/env dash

case "$1" in
--update)
  ghostty --title=Update -e 'yay -Syu; flatpak update'
  echo "0" >"$HOME"/.local/state/updates
  eww update updates="{\"tooltip\":\"\",\"text\":\"\"}"
  eww reload
  ;;
--check)
  AUR=$(yay -Qua | wc -l)
  OFFICIAL=$(checkupdates | wc -l)
  FLATPAK=$(flatpak remote-ls --updates | wc -l)
  echo $((OFFICIAL + AUR + FLATPAK))
  ;;
*)
  COUNT=$(cat "$HOME"/.local/state/updates)
  if test "$COUNT" = "0"; then
    printf "{\"tooltip\":\"No Updates\",\"text\":\" \"}"
  else
    printf "{\"tooltip\":\"%s\",\"text\":\" \"}" "$COUNT"
  fi
  exit 0
  ;;
esac
