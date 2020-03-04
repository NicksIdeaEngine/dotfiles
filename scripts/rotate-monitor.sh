#!/bin/zsh

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
/mnt/sdc1/Dropbox/scripts/polybarstart.sh
