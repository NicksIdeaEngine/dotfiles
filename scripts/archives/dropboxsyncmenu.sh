#!/bin/bash

# this is a temp file used for holding the list of Dropbox
# directories you can add or remove from the exclude list
FILE=/home/efex/.temp/dropboxsyncmenu.tmp

# Set this variable to wherever your Dropbox directory is
DROPBOX=/mnt/sdc1/Dropbox

# removes $FILE if it exists, then makes a new one
if [[ -e $FILE ]]; then
  rm -f $FILE
  touch $FILE
else
  touch $FILE
fi

# this cleans up the list display
cd $DROPBOX

MENU="$(rofi -theme centermenu -sep '|' -dmenu -p 'Choose which list to display: ' <<< 'Synced Directories|Excluded Directories')"

load_menu() {
  case "$MENU" in
    'Synced Directories')
      # pull tree of current Dropbox directory
      tree -dfi --noreport -L 2 -o $FILE

      # prune results from tree to remove escape characters
      # also removes first line to avoid accidentally unsyncing entire directory
      sed -i -e 's/.*\.\///g' -e '/.\.\x1b./d' -e 's/\x1b.*//g' -e '/\./d' $FILE

      # displays list from file as rofi menu
      syncselection=$(cat "$FILE" | rofi -dmenu -theme centermenu -p "Choose directory to add to exclude list:")

      # if no selection, then exit
      [[ -z $syncselection ]] && rm -f $FILE && exit

      # add selection to exclude list
      dropbox exclude add $syncselection && load_menu
      ;;
    'Excluded Directories')
      # send current exclude list to $FILE
      dropbox exclude > $FILE

      # remove first line so it isn't selectable
      sed -i '/Excluded:/d' $FILE

      # displays list from file as rofi menu
      excludeselection=$(cat "$FILE" | rofi -dmenu -theme centermenu -p "Choose directory to remove from exclude list:")

      # if no selection, then exit
      [[ -z $excludeselection ]] && rm -f $FILE && exit

      # remove selection from exclude list
      dropbox exclude remove $excludeselection && load_menu
      ;;
    *) ;;
  esac
}

load_menu

if [[ -e $FILE ]]; then
  rm -f $FILE
fi
