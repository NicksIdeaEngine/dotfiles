#!/bin/bash

TEMP="$(( $(cat /sys/class/hwmon/hwmon0/temp1_input) / 1000))"
FAN="$(cat /sys/class/hwmon/hwmon0/fan1_input)"

case "$1" in
  --poly)
    echo "  ${TEMP}  ${FAN}"
    ;;
  --notify)
    notif-send --urgency=normal "CPU"
    ;;
  *) echo "missed" ;;
esac
