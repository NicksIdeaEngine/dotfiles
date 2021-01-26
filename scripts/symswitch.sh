#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

MOD_DIR=".config"
SOURCE_DIR="/home/efex/$MOD_DIR"
SOURCE_FILE="$SOURCE_DIR/$1"
DEST_DIR="/home/efex/dots/$MOD_DIR"
DEST_FILE="$DEST_DIR/$1"

if [[ ! -f "$DEST_FILE" ]]; then
  mv "$SOURCE_DIR/$1" "$DEST_FILE"
  ln -s "$DEST_FILE" "$SOURCE_DIR"
elif [[ ! -f "$SOURCE_FILE" ]]; then
  ln -s "$DEST_FILE" "$SOURCE_DIR"
elif [[ -f "$DEST_FILE" && -f "$SOURCE_FILE" ]]; then
  rm -rvf $SOURCE_FILE
  ln -s "$DEST_FILE" "$SOURCE_DIR"
fi

