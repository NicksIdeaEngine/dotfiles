#!/bin/zsh
. ~/.aliases
case "$1" in
  --drop)
    /mnt/sdc1/Dropbox/scripts/rofidropmenu.sh
    ;;
  --oneliner)
    /mnt/sdc1/Dropbox/scripts/rofioneliner.sh
    ;;
  --autoscript )
    /mnt/sdc1/Dropbox/scripts/autoscriptmenu.sh
    ;;
  *)
    ;;
esac
