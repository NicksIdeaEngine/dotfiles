#!/bin/bash
# strict mode
# set -euo pipefail
# IFS=$'\n\t'

screen="DisplayPort-0"

descr=$(xrandr | grep "$screen")

if echo "$descr" | grep disconnected
then
	echo "No $screen connected"
	exit 1
fi

alt="left"

if echo "$descr" | grep --quiet -P "^[^(]*$alt"
then
	rotate="normal"
else
	rotate="$alt"
fi

xrandr --output $screen --rotate $rotate
xrandr --output HDMI-A-0 --auto --left-of DisplayPort-0
xrandr --output DisplayPort-1 --auto --right-of DisplayPort-0
