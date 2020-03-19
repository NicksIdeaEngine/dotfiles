#!/bin/zsh

src_dir="/home/efex/dots"
dest_dir="/home/efex"

dirscan() {
  local mod_dir="$1"

  for src_file in $src_dir/$mod_dir/*; do
    local dest_file="$dest_dir/$mod_dir/${src_file##*/}"

    if [[ ! -h $dest_file ]]; then
      echo "$src_file linked to $dest_file"
      ln -s "$src_file" "$dest_file"
    fi
  done
}

dirscan "refs"
dirscan "scripts"
