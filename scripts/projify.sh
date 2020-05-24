#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

arg="${1:-}"

# check for vim session, or create one
proj_launch() {
  local proj_name="${1:-}"
  local src_dir="/home/efex/proj/$proj_name"
  if [[ ! -d $src_dir ]]; then
    mkdir -p $src_dir
  fi
  cd $src_dir

  if [[ -f $src_dir/Session.vim ]]; then
    kitty -T "$proj_name" \
      -e tmux new-session \
      -s "$proj_name" \
      -d "nvim -S $src_dir/Session.vim" \; \
      attach
  else
    kitty -T "$proj_name" \
      -e tmux new-session \
      -s "$proj_name" \
      -d "nvim $src_dir" \; \
      attach
  fi
}

proj_menu() {
  selected=$(ls "$HOME/proj" | rofi -dmenu -theme projify -p "projify")
  [[ -z $selected ]] && exit
  proj_launch $selected
}

if [[ $arg == "" ]]; then
  proj_menu
else
  proj_launch $arg
fi
