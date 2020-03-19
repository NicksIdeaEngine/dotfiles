#!/bin/zsh

SCRIPT_FOLDER="$HOME/dots/scripts"
SCRIPT_FILE="$SCRIPT_FOLDER/$1.sh"
LINK_FILE="$HOME/scripts/$1.sh"

if [[ -f "$SCRIPT_FILE" ]]; then
  nvim "$SCRIPT_FILE"
else
  echo '#!/bin/zsh' > "$SCRIPT_FILE"
  chmod +x "$SCRIPT_FILE"
  ln -s "$SCRIPT_FILE" "$LINK_FILE"
  nvim "$SCRIPT_FILE"
fi
