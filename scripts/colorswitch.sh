#!/bin/bash

switcher() {
  cp "$HOME/.Xresources-$1" "$HOME/.Xresources"
  cp "$HOME/.config/kitty/kitty-$1.conf" "$HOME/.config/kitty/kitty-colors.conf"
  mv "$HOME/.cache/kitty-$2" "$HOME/.cache/kitty-$1"
}

selector() {
  menu="$(rofi -theme sysmenu -sep '|' -dmenu -p 'Theme: ' <<< 'Light|Dark')"
  case "$menu" in
    *Light)
      switcher "light" "dark"
      ;;
    *Dark)
      switcher "dark" "light"
      ;;
    *) ;;
  esac
}

selector
