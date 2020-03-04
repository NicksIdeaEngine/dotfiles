#!/bin/zsh

selected=$(ls "/mnt/sdc1/Dropbox/scripts" | rofi -dmenu -theme oneliner -p "autoscript: ")
[[ -z $selected ]] && exit
kitty -e /mnt/sdc1/Dropbox/scripts/autoscript.sh ${selected%.sh}
