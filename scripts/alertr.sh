#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

alert_module="${1:-}"
alert_type="${2:-}"

case "$alert_module" in
  --date)
    line1="$(date +'%A, %B %d')"
    line2="$(date +'%H:%M')"
    line3="$(date +'Week %W, Day %j')"
    response="It is currently ${line2}"$'\n'"on ${line1}"$'\n'"${line3}"
    ;;
  --cpustatus)
    TEMP="$(( $(cat /sys/class/hwmon/hwmon0/temp1_input) / 1000))"
    FAN="$(cat /sys/class/hwmon/hwmon0/fan1_input)"
    response="  ${TEMP}  ${FAN}"
    ;;
  --gpustatus)
    front_fan="$(cat /sys/class/hwmon/hwmon0/fan2_input)"
    top_fans="$(cat /sys/class/hwmon/hwmon0/fan3_input)"
    bottom_fans="$(cat /sys/class/hwmon/hwmon0/fan4_input)"
    back_fan="$(cat /sys/class/hwmon/hwmon0/fan6_input)"
    temp2="$(( $(cat /sys/class/hwmon/hwmon0/temp2_input) / 1000))"
    temp3="$(( $(cat /sys/class/hwmon/hwmon0/temp3_input) / 1000))"
    temp4="$(( $(cat /sys/class/hwmon/hwmon0/temp4_input) / 1000))"
    temp5="$(( $(cat /sys/class/hwmon/hwmon0/temp5_input) / 1000))"
    temp6="$(( $(cat /sys/class/hwmon/hwmon0/temp6_input) / 1000))"
    response="front  ${front_fan}"$'\n'"top  ${top_fans}"$'\n'"bottom  ${bottom_fans}"$'\n'"back  ${back_fan}"$'\n'"temp2 ${temp2}"$'\n'"temp3 ${temp3}"
    ;;
  --fanstatus)
    TEMP="$(( $(cat /sys/class/hwmon/hwmon3/temp1_input) / 1000))"
    FAN="$(cat /sys/class/hwmon/hwmon3/fan1_input)"
    response="  ${TEMP}  ${FAN}"
    ;;
  *) response="missed module" ;;
esac

case "$alert_type" in
  --poly)
    echo "$response"
    ;;
  --notify)
    notify-send --urgency=normal "$response"
    ;;
  *) notify-send --urgency=normal "missed type" ;;
esac

