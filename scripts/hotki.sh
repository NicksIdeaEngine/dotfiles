#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

grep "^\$\(\(m\|sm\|cm\|scm\)od\|br\)" ~/.config/i3/config | rofi -i -dmenu
