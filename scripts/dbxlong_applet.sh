#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

dbxlong=/mnt/sdc1/dbxlong
filter_file=/home/efex/.config/rclone/dbxlong-filter.txt
remote=dbxlong
push_log=/home/efex/dbxlong-rclone-push.log
pull_log=/home/efex/dbxlong-rclone-pull.log

[[ -f $push_log ]] && rm $push_log
[[ -f $pull_log ]] && rm $pull_log

dbxlong_push() {
  notify-send --urgency=normal "push begins"
  rclone sync -v \
    --create-empty-src-dirs \
    $dbxlong $remote: \
    --filter-from $filter_file \
    --log-file=$push_log
}

dbxlong_pull() {
  notify-send --urgency=normal "pull begins"
  rclone sync -v \
    --create-empty-src-dirs \
    $remote: $dbxlong \
    --filter-from $filter_file \
    --log-file="$pull_log"
}

selection="$(rofi -theme sysmenu -sep '|' -dmenu -p 'dbxlong' <<<'push|pull')"

case "$selection" in
  *push) dbxlong_push ;;
  *pull) dbxlong_pull ;;
  *) notify-send --urgency=normal "nope" ;;
esac
