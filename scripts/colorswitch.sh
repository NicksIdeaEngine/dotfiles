#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

switcher() {
  local new_scheme="${1:-}"
  local old_scheme="${2:-}"

  cp "$HOME/.Xresources-$new_scheme" "$HOME/.Xresources"
  cp "$HOME/.config/kitty/kitty-$new_scheme.conf" "$HOME/.config/kitty/kitty-colors.conf"
  cp "$HOME/.tmux/lightline_visual_$new_scheme" "$HOME/.tmux/lightline_visual"
  mv "$HOME/.cache/kitty-$old_scheme" "$HOME/.cache/kitty-$new_scheme"
  sed -i "s/background=$old_scheme/background=$new_scheme/g" /home/efex/.config/nvim/init.vim
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
