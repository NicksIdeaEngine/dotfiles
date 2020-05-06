#!/bin/bash

TEMP="$(( $(cat /sys/class/hwmon/hwmon3/temp1_input) / 1000))"
FAN="$(cat /sys/class/hwmon/hwmon3/fan1_input)"

case "$1" in
  --poly)
    echo "  ${TEMP}  ${FAN}"
    ;;
  --notify)
    notify-send --urgency=normal "GPU"
    ;;
  *) echo "missed" ;;
esac
