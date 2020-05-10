#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

. ~/.aliases

arg="${1:-}"

case "$arg" in
  --drop)
    $HOME/scripts/rofidropmenu.sh
    ;;
  --oneliner)
    $HOME/scripts/rofioneliner.sh
    ;;
  --autoscript )
    $HOME/scripts/autoscriptmenu.sh
    ;;
  *)
    ;;
esac
