#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

MOD_DIR=".config/i3/layouts"
SOURCE_DIR="/home/efex/$MOD_DIR"
DEST_DIR="/home/efex/dots/$MOD_DIR"
DEST_FILE="$DEST_DIR/$1"

if [[ ! -f "$DEST_FILE" ]]; then
  mv "$SOURCE_DIR/$1" "$DEST_FILE"
  ln -s "$DEST_FILE" "$SOURCE_DIR"
elif [[ ! -f "$SOURCE_DIR/$1" ]]; then
  ln -s "$DEST_FILE" "$SOURCE_DIR"
fi

