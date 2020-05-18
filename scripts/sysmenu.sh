#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

arg="${1:-}"

case "$arg" in
--menu)
  MENU="$(rofi -theme sysmenu -sep '|' -dmenu -p 'System' <<<' Lock| Logout| Reboot| Shutdown')"
  case "$MENU" in
  *Lock) i3exit lock ;;
  *Logout) i3exit logout ;;
  *Reboot) systemctl reboot ;;
  *Shutdown) systemctl -i poweroff ;;
  esac
  ;;
*)
  echo "襤  "
  ;;
esac
