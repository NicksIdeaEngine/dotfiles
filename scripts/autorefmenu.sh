#!/bin/zsh

selected=$(ls "$HOME/refs" | rofi -dmenu -theme oneliner -p "autoref: ")
[[ -z $selected ]] && exit
kitty -e $HOME/scripts/autoref.sh ${selected%.md}
