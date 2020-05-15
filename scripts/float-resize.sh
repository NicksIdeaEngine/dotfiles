#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

ratio1=${1:-}
echo "$ratio1"

ratio2=${2:-}
echo "$ratio2"

wid=$(pfw)
echo "$wid"
root=$(lsw -r)
echo "$root"
sw=$(wattr w $root)
echo "$sw"
sh=$(wattr h $root)
echo "$sh"

wrs -a $((ratio1 * sw / 400)) $((ratio2 * sh / 100)) $wid
