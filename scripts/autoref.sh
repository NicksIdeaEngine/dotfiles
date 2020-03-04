#!/bin/zsh

REF_FOLDER="/mnt/sdc1/Dropbox/dots/refs"
REF_FILE="$REF_FOLDER/$1.md"
LINK_FILE="/mnt/sdc1/Dropbox/refs/$1.md"

if [[ -f "$REF_FILE" ]]; then
  nvim "$REF_FILE"
else
  echo '# Title' > "$REF_FILE"
  ln -s "$REF_FILE" "$LINK_FILE"
  nvim "$REF_FILE"
fi
