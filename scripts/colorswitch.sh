#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

dot_dir="$HOME/dots"

light_scheme=("#f9f5d7" "#ebdbb2" "#d5c4a1" "#bdae93" "#a89984" "#282828" "#504945" "#665c54" "#fbf1c7" "#7c6f64" "#9d0006" "#79740e" "#b57614" "#076678" "#8f3f71" "#427b58" "#3c3836" "#af3a03")

dark_scheme=("#1d2021" "#3c3836" "#504945" "#665c54" "#7c6f64" "#fbf1c7" "#d5c4a1" "#bdae93" "#282828" "#a89984" "#fb4934" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#8ec07c" "#ebdbb2" "#fe8019")

placeholders=()

file_list=(
  ".config/kitty/kitty-colors.conf"
  ".config/polybar/colors.ini"
  ".tmux/lightline_visual"
  ".config/rofi/gruvbox.rasi"
)

# ".mozilla/firefox/65rf3aso.default-release/chrome/userChrome.css"

switcher() {
  new_scheme_type=${1:-}

  if [[ -f "$HOME/.cache/kitty-$new_scheme_type" ]]; then
    notify-send --urgency=normal "colors unchanged"
    return
  fi

  if [[ "$new_scheme_type" == "light" ]]; then
    new_scheme=("${light_scheme[@]}")
    old_scheme=("${dark_scheme[@]}")
    old_scheme_type="dark"
  else
    new_scheme=("${dark_scheme[@]}")
    old_scheme=("${light_scheme[@]}")
    old_scheme_type="light"
  fi

  for file in ${file_list[@]}; do
    # notify-send --urgency=normal "$file"
    for ((i = 0; i < ${#new_scheme[@]}; i++)); do
      # notify-send --urgency=normal "$i"
      placeholders+=("placeholder-$i-tmp")
      sed -i "s/${old_scheme[i]}/${placeholders[i]}/g" "$dot_dir/$file" && echo "$dot_dir/$file"
      # notify-send --urgency=normal "$dot_dir/$file"
    done
    for ((i = 0; i < ${#new_scheme[@]}; i++)); do
      sed -i "s/${placeholders[i]}/${new_scheme[i]}/g" "$dot_dir/$file"
    done
  done

  sed -i "s/background=$old_scheme_type/background=$new_scheme_type/g" \
    /home/efex/.config/nvim/plugin_config.vim
  mv "$HOME/.cache/kitty-$old_scheme_type" "$HOME/.cache/kitty-$new_scheme_type"
  i3-msg "restart"

  notify-send --urgency=normal "from $old_scheme_type to $new_scheme_type"
}

menu_launcher() {
  menu="$(rofi -theme sysmenu -sep '|' -dmenu -p 'Theme' <<< 'Light|Dark|Reset')"
  case "$menu" in
    *Light)
      switcher "light"
      ;;
    *Dark)
      switcher "dark"
      ;;
    *Reset)
      for file in ${file_list[@]}; do
        cp "$dot_dir/$file.reset" "$dot_dir/$file"
      done
      notify-send --urgency=normal "reset complete"
      ;;
    *) ;;
  esac
}

menu_launcher
