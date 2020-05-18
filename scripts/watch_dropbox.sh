#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

dbx=/mnt/sdc1/dbx
filter_file=/home/efex/.config/rclone/filter-from.txt
remote=dbx
watchlog=/home/efex/rclone-watch.log

if [[ -f $watchlog ]]; then
  rm $watchlog
fi

find $dbx \
  ! -path "**/\.git" \
  ! -path "**/\.git/**" \
  ! -path "**/node\_modules" \
  ! -path "**/node\_modules/**" \
  ! -path "**/nvim/plugged" \
  ! -path "**/nvim/plugged/**" \
  ! -path "**/\.tmux/plugins" \
  ! -path "**/\.tmux/plugins/**" \
  ! -path "**/\.tmux/resurrect" \
  ! -path "**/\.tmux/resurrect/**" \
  ! -path "**/todo/\.actions\.d" \
  ! -path "**/todo/\.actions\.d/**" \
  | entr -r \
  rclone sync -v \
  --create-empty-src-dirs \
  $dbx $remote: \
  --filter-from $filter_file \
  --log-file=$watchlog

# ! -path "**/\.git" \
# ! -path "**/\.git/**" \
# ! -path "**/node\_modules" \
# ! -path "**/node\_modules/**" \
# ! -path "**/nvim/plugged" \
# ! -path "**/nvim/plugged/**" \
# ! -path "**/\.tmux/plugins" \
# ! -path "**/\.tmux/plugins/**" \
# ! -path "**/todo/\.actions\.d" \
# ! -path "**/todo/\.actions\.d/**" \
