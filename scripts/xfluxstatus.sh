#!/bin/zsh

case "$1" in
	--status)
		if [ "$(pgrep xflux)" ]; then
			notify-send "xflux is up and running!"
		else
			notify-send "xflux isn't running!"
		fi
		;;
  --reboot)
    if [ "$(pgrep xflux)" ]; then
      killall xflux; sleep 1; xflux -z 33101 -k 2800 &; sleep 5; polybar -r
    else
      xflux -z 33101 -k 2800 &; sleep 5; polybar -r
    fi
    ;;
  --off)
    if [ "$(pgrep xflux)" ]; then
      killall xflux; sleep 5; polybar -r
    fi
    ;;
	*)			
		if pgrep -x "xflux" > /dev/null; then
			echo ""
		else
			echo "---"
		fi
		;;
esac
