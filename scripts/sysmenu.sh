#!/bin/bash

if [[ -f /etc/os-release ]]; then
  . /etc/os-release
  OS=$NAME
fi

case "$NAME" in
  "Ubuntu" )
    case "$1" in
      --menu)
        MENU="$(rofi -theme sysmenu -sep '|' -dmenu -p 'System: ' <<< ' Lock| Logout| Reboot| Shutdown')"
          case "$MENU" in
            *Lock) i3lock-fancy ;;
            *Logout) i3-msg exit ;;
            *Reboot) systemctl reboot ;;
            *Shutdown) systemctl -i poweroff ;;
          esac
        ;;
      *)
        echo "襤  "
        ;;
    esac
    ;;
  "Manjaro Linux" )
    case "$1" in
      --menu)
        MENU="$(rofi -theme sysmenu -sep '|' -dmenu -p 'System: ' <<< ' Lock| Logout| Reboot| Shutdown')"
          case "$MENU" in
            *Lock) i3exit lock ;;
            *Logout) i3exit logout ;;
            *Reboot) i3exit reboot ;;
            *Shutdown) systemctl -i poweroff ;;
          esac
        ;;
      *)
        echo "襤  "
        ;;
    esac
    ;;
  *)
    ;;
esac
