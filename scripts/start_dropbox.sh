#!/bin/bash

dbx_dir=/mnt/sdc1/dbx
filter_file=/home/efex/.config/rclone/filter-from.txt
remote=dbx
backup=/mnt/sdc1/.rclone-mount-cache
synclog=/home/efex/rclone-sync.log
copylog=/home/efex/rclone-copy.log

if [[ -f $copylog ]]; then
  rm $copylog
fi

if [[ -f $synclog ]]; then
  rm $synclog
fi

rclone copy -uvv \
  --create-empty-src-dirs \
  $remote: $dbx_dir \
  --backup-dir $backup \
  --suffix .$(date +"%Y-%m-%d-%H-%M-%S") \
  --filter-from $filter_file \
  --log-file="$copylog" \
  && find $dbx_dir | \
  entr -d -r \
  rclone sync -vv \
  --create-empty-src-dirs \
  $dbx_dir $remote: \
  --filter-from $filter_file \
  --log-file="$synclog"

