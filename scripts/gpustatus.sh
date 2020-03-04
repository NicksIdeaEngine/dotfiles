#!/bin/zsh

TEMP="$(( $(cat /sys/class/hwmon/hwmon3/temp1_input) / 1000))"
FAN="$(cat /sys/class/hwmon/hwmon3/fan1_input)"

echo "  ${TEMP}  ${FAN}"
