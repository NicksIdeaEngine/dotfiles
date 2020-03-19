#!/bin/zsh
. ~/.aliases
case "$1" in
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
