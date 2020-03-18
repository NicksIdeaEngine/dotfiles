#!/bin/zsh

SOURCE_DIR="/home/efex"
DEST_DIR="/home/efex/dots/ubuntu"
DEST_FILE="$DEST_DIR/$1"

if [[ ! -f "$DEST_FILE" ]]; then
  mv "$SOURCE_DIR/$1" "$DEST_FILE"
  ln -s "$DEST_FILE" "$SOURCE_DIR"
elif [[ ! -f "$SOURCE_DIR/$1" ]]; then
  ln -s "$DEST_FILE" "$SOURCE_DIR"
fi

