#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

arg="${1:-}"

case "$arg" in
	--status)
		if [ "$(pgrep dropbox)" ]; then
			notify-send "$(dropbox status)"
		else
			notify-send "Dropbox isn't running!"
		fi
		;;
	*)			
		if pgrep -x "dropbox" > /dev/null; then
			echo ""
		else
			echo "---"
		fi
		;;
esac
