#!/bin/zsh

selected=$(ls "/mnt/sdc1/Dropbox/refs" | rofi -dmenu -theme oneliner -p "autoref: ")
[[ -z $selected ]] && exit
kitty -e /mnt/sdc1/Dropbox/scripts/autoref.sh ${selected%.md}
