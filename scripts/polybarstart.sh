#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

(polybar -c ~/.config/polybar/config.ini mandelight &)
