#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

dbx=/mnt/sdc1/dbx
filter_file=/home/efex/.config/rclone/dbx-filter.txt
remote=dbx
push_log=/home/efex/dbx-rclone-push.log
pull_log=/home/efex/dbx-rclone-pull.log
watchlog=/home/efex/dbx-rclone-watch.log

arg="${1:-}"

[[ -f $push_log ]] && rm $push_log
[[ -f $pull_log ]] && rm $pull_log
[[ -f $watchlog ]] && rm $watchlog

dbx_push() {
  notify-send --urgency=normal "push begins"
}

dbx_pull() {
  notify-send --urgency=normal "pull begins"
}

dbx_watch() {
  notify-send --urgency=normal "watch begins"
  find $dbx \
    ! -path "**/\.git" \
    ! -path "**/\.git/**" \
    ! -path "**/node\_modules" \
    ! -path "**/node\_modules/**" \
    ! -path "**/\.cache" \
    ! -path "**/\.cache/**" \
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
}

if [[ -z $arg ]]; then
  selection="$(rofi -theme sysmenu -sep '|' -dmenu -p 'dbxlong' <<<'push|pull|watch')"
else
  selection=$arg
fi

case "$selection" in
  *push|--push) dbx_push ;;
  *pull|--pull) dbx_pull ;;
  *watch|--watch) dbx_watch ;;
  *) notify-send --urgency=normal "nope" ;;
esac
