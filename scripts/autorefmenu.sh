#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

selected=$(ls "$HOME/refs" "$HOME/refs/private" "$HOME/refs/archives" | rofi -dmenu -theme dropmenu -p "autoref: ")
[[ -z $selected ]] && exit
kitty -e $HOME/scripts/autoref.sh ${selected%.md}
