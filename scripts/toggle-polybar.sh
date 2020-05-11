#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

if [[ $(pgrep -x polybar) ]]; then
  killall -q polybar
  sleep 1
else
  (polybar -c ~/.config/polybar/config.ini mandelight &)
fi

