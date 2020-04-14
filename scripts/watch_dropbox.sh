#!/bin/bash

dbx=/mnt/sdc1/dbx
filter_file=/home/efex/.config/rclone/filter-from.txt
remote=dbx

find $dbx | \
  entr -d -r \
  rclone sync -v \
  --create-empty-src-dirs \
  $dbx $remote: \
  --filter-from $filter_file
