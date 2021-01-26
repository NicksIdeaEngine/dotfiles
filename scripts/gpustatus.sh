#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

TEMP="$(( $(cat /sys/class/hwmon/hwmon2/temp1_input) / 1000))"
FAN="$(cat /sys/class/hwmon/hwmon2/fan1_input)"

arg="${1:-}"

case "$arg" in
  --poly)
    echo "  ${TEMP}  ${FAN}"
    ;;
  --notify)
    notify-send --urgency=normal "GPU"
    ;;
  *) echo "missed" ;;
esac
