#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

target_dirs=(
  "/home/efex/.local/kitty"
)

git_check() {
  arg="${1:-}"

  for d in $arg; do
    cd $d
    local test=`git status`
    echo $test
  done
}

git_check $target_dirs
