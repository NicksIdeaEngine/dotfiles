#!/bin/bash
# strict mode
# set -euo pipefail
# IFS=$'\n\t'

screen="HDMI-A-0"

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
xrandr --output DisplayPort-0 --auto --left-of $screen
xrandr --output DisplayPort-1 --auto --right-of $screen
