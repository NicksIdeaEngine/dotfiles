#!/bin/zsh

REF_FOLDER="$HOME/dots/refs"
REF_FILE="$REF_FOLDER/$1.md"
LINK_FILE="$HOME/refs/$1.md"

if [[ -f "$REF_FILE" ]]; then
  nvim "$REF_FILE"
else
  echo '# Title' > "$REF_FILE"
  ln -s "$REF_FILE" "$LINK_FILE"
  nvim "$REF_FILE"
fi
