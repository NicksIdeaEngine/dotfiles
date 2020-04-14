#!/bin/bash

case "$1" in
	--status)
		if [ "$(pgrep rescuetime)" ]; then
			notify-send "Rescuetime is up and running."
      notify-send "Make great use of your time!"
		else
			notify-send "Rescuetime isn't running!"
		fi
		;;
  --reboot)
    rescuetime &
    notify-send "RescueTime is back up and running!"
    ;;
  --off)
    if [ "$(pgrep rescuetime)" ]; then
      killall rescuetime
      notify-send "RescueTime is off!"
    else
      rescuetime
      notify-send "RescueTime is back up and running!"
    fi
    ;;
	*)			
		if pgrep -x "rescuetime" > /dev/null; then
			echo "祥"
		else
			echo "精"
		fi
		;;
esac
