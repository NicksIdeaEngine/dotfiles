#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

arg="${1:-}"

REF_FOLDER="$HOME/dots/refs"
REF_FILE="$REF_FOLDER/$arg.md"

if [[ -f "$REF_FILE" ]]; then
  nvim "$REF_FILE"
else
  echo "# $arg" > "$REF_FILE"
  nvim "$REF_FILE"
fi
