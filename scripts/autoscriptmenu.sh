#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

selected=$(ls "$HOME/scripts" "$HOME/scripts/archives" "$HOME/scripts/private" | rofi -dmenu -theme oneliner -p "autoscript: ")
[[ -z $selected ]] && exit
kitty -e $HOME/scripts/autoscript.sh ${selected%.sh}
