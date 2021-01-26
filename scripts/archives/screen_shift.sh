#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

left='DisplayPort-0'
middle='HDMI-A-0'
right='DisplayPort-1'

choice="$(rofi -theme sysmenu -sep '|' -dmenu -p 'Screen Layout' <<<'Triple|Single')"

case "$choice" in
  *Triple)
    xrandr --setmonitor $left "1600/432x900/236+0+0" $left \
      --setmonitor $right "1920/476x1080/268+4160+0" $right \
      --setmonitor $middle "2560/553x1440/311+1600+0" $middle \
      --output $middle --primary && ~/.fehbg
    ;;
  *Single) xrandr --output $middle --primary && ~/.fehbg ;;
  *) ;;
esac


# $ex xrandr --output $mscreen --primary \
#   --output $lscreen --auto --left-of $mscreen \
#   --output $rscreen --auto --right-of $mscreen
