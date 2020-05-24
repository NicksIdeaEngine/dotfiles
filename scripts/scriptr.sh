#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

script_dir="$HOME/scripts"

selected=$(ls "$HOME/scripts" "$HOME/scripts/archives" "$HOME/scripts/private" | rofi -dmenu -theme scriptr -p "scriptr")
[[ -z $selected ]] && exit

if [[ -f "$script_dir/$selected" ]]; then
  kitty -e nvim "$script_dir/$selected"
else
  echo "#!/bin/bash"$'\n'"# strict mode"$'\n'"set -euo pipefail"$'\n'"IFS=$'\n\t'" > "$script_dir/$selected.sh"
  chmod +x "$script_dir/$selected.sh"
  kitty -e nvim "$script_dir/$selected.sh"
fi
