#!/bin/bash

selected=$(ls "$HOME/refs" "$HOME/refs/private" | rofi -dmenu -theme dropmenu -p "autoref: ")
[[ -z $selected ]] && exit
kitty -e $HOME/scripts/autoref.sh ${selected%.md}
