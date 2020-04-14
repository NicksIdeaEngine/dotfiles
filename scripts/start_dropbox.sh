#!/bin/bash

dbx_dir=/mnt/sdc1/dbx
filter_file=/home/efex/.config/rclone/filter-from.txt
remote=dbx
backup=/mnt/sdc1/.rclone-mount-cache

rclone copy -uv \
  --create-empty-src-dirs \
  $remote: $dbx_dir \
  --backup-dir $backup \
  --suffix .$(date +"%Y-%m-%d-%H-%M-%S") \
  --filter-from $filter_file \
  && find $dbx_dir | \
  entr -d -r \
  rclone sync -v \
  --create-empty-src-dirs \
  $dbx_dir $remote: \
  --filter-from $filter_file
