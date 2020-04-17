#!/bin/bash

dbx=/mnt/sdc1/dbx
filter_file=/home/efex/.config/rclone/filter-from.txt
remote=dbx
watchlog=/home/efex/rclone-watch.log

if [[ -f $watchlog ]]; then
  rm $watchlog
fi

find $dbx | entr -r \
  rclone sync -v \
  --create-empty-src-dirs \
  $dbx $remote: \
  --filter-from $filter_file \
  --log-file=$watchlog
