#!/bin/zsh

case "$1" in
  --menu)
    MENU="$(rofi -theme sysmenu -sep '|' -dmenu -p 'System: ' <<< ' Lock| Logout| Reboot| Shutdown')"
	    case "$MENU" in
        *Lock) i3lock-fancy ;;
        *Logout) i3-msg exit ;;
        *Reboot) systemctl reboot ;;
        *Shutdown) systemctl -i poweroff
      esac
    ;;
  *)
    echo "襤  "
    ;;
esac
