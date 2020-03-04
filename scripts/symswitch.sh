#!/bin/zsh

SOURCE_DIR="/home/efex/.mozilla/firefox/wmmhtufq.dev-edition-default-2/chrome"
DEST_DIR="/mnt/sdc1/Dropbox/dots/ubuntu/.mozilla/firefox/wmmhtufq.dev-edition-default-2/chrome"
DEST_FILE="$DEST_DIR/$1"

if [[ ! -f "$DEST_FILE" ]]; then
  mv "$SOURCE_DIR/$1" "$DEST_FILE"
  ln -s "$DEST_FILE" "$SOURCE_DIR"
fi

