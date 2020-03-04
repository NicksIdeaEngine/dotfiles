#!/bin/zsh

TEMP="$(( $(cat /sys/class/hwmon/hwmon0/temp1_input) / 1000))"
FAN="$(cat /sys/class/hwmon/hwmon0/fan1_input)"

echo "  ${TEMP}  ${FAN}"
