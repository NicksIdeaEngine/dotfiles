#!/bin/bash

selected=$(ls "$HOME/scripts" "$HOME/archives" | rofi -dmenu -theme oneliner -p "autoscript: ")
[[ -z $selected ]] && exit
kitty -e $HOME/scripts/autoscript.sh ${selected%.sh}
