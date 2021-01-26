#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

arg="${1:-}"

TEMP="$(( $(cat /sys/class/hwmon/hwmon3/temp1_input) / 1000))"
FAN="$(cat /sys/class/hwmon/hwmon3/fan1_input)"

case "$arg" in
  --poly)
    echo "  ${TEMP}  ${FAN}"
    ;;
  --notify)
    notify-send --urgency=normal "CPU"
    ;;
  *) echo "missed" ;;
esac
