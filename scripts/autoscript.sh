#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

SCRIPT_FOLDER="$HOME/dots/scripts"
SCRIPT_FILE="$SCRIPT_FOLDER/$1.sh"

if [[ -f "$SCRIPT_FILE" ]]; then
  nvim "$SCRIPT_FILE"
else
  echo "#!/bin/bash"$'\n'"# strict mode"$'\n'"set -euo pipefail"$'\n'"IFS=$'\n\t'" > "$SCRIPT_FILE"
  chmod +x "$SCRIPT_FILE"
  nvim "$SCRIPT_FILE"
fi
