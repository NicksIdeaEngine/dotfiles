#!/bin/bash

front_fan="$(cat /sys/class/hwmon/hwmon0/fan2_input)"
top_fans="$(cat /sys/class/hwmon/hwmon0/fan3_input)"
bottom_fans="$(cat /sys/class/hwmon/hwmon0/fan4_input)"
back_fan="$(cat /sys/class/hwmon/hwmon0/fan6_input)"
temp2="$(( $(cat /sys/class/hwmon/hwmon0/temp2_input) / 1000))"
temp3="$(( $(cat /sys/class/hwmon/hwmon0/temp3_input) / 1000))"
temp4="$(( $(cat /sys/class/hwmon/hwmon0/temp4_input) / 1000))"
temp5="$(( $(cat /sys/class/hwmon/hwmon0/temp5_input) / 1000))"
temp6="$(( $(cat /sys/class/hwmon/hwmon0/temp6_input) / 1000))"

case "$1" in
  --poly)
    echo "|   ${front_fan}  ${top_fans}  ${bottom_fans}  ${back_fan}  |  ${temp2} ${temp3}"
    ;;
  --notify)
    notify-send --urgency=normal "Front: ${front_fan}"$'\n'"Top: ${top_fans}"$'\n'"Bottom: ${bottom_fans}"$'\n'"Back: ${back_fan}"$'\n'"Temp2: ${temp2}"$'\n'"Temp3: ${temp3}"
    ;;
  *) echo "missed" ;;
esac
