#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

arg="${1:-}"

case "$arg" in
	--status)
		if [[ $(pgrep redshift) ]]; then
			notify-send "redshift is up and running!"
		else
			notify-send "redshift isn't running!"
		fi
		;;
  --reboot)
    if [[ "$(pgrep redshift)" ]]; then
      kill $(pgrep redshift)
      sleep 1 && redshift -c /home/efex/.config/redshift.conf 
      sleep 5 && polybar -r
    else
      redshift -c /home/efex/.config/redshift.conf
      sleep 5 && polybar-r
    fi
    ;;
  --off)
    if [[ "$(pgrep redshift)" ]]; then
      killall redshift && sleep 5 && polybar -r
    fi
    ;;
	*)			
		if pgrep -x "redshift" > /dev/null; then
			echo ""
		else
			echo "---"
		fi
		;;
esac
