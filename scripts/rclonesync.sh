#!/bin/bash

filter_file=/home/efex/.config/rclone/filter-from.txt
dropbox=/mnt/sdc1/dbx
backup=/mnt/sdc1/.rclone-mount-cache
synclog=/home/efex/rclone-sync.log
copylog=/home/efex/rclone-copy.log

if [[ -f $copylog ]]; then
  rm $copylog
fi

rclone copy -uvvP \
  --create-empty-src-dirs \
  dbx: $dropbox \
  --backup-dir $backup \
  --suffix .$(date +"%Y-%m-%d-%H-%M-%S") \
  --filter-from $filter_file \
  --log-file="$copylog"

if [[ -f $synclog ]]; then
  rm $synclog
fi

rclone sync -vvP \
  --create-empty-src-dirs \
  $dropbox dbx: \
  --filter-from $filter_file \
  --log-file="$synclog"

# sudo rclone copy -uvP \
#   --dry-run \
#   --create-empty-src-dirs \
#   dbx: $dropbox \
#   --backup-dir $backup \
#   --suffix .$(date +"%Y-%m-%d-%H-%M-%S") \
#   --include-from $include_file

# rclone sync -vP \
#   --dry-run \
#   --create-empty-src-dirs \
#   $dropbox dbx: \
#   --include-from $include_file
