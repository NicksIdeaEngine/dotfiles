#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

# sudo apt install git
# mkdir /mnt/sdc1/dbx
# mkdir /mnt/sdc1/dbxlong
# mkdir /mnt/sdc1/dbx/dots
# git clone https://github.com/NicksIdeaEngine/dotfiles.git /mnt/sdc1/dbx/dots
# rmdir /home/efex/Documents
# rmdir /home/efex/Pictures
# rmdir /home/efex/Music
# rmdir /home/efex/Videos
# mv /home/efex/Downloads /home/efex/dwn
# ln -sv /mnt/sdc1/dbx/code /home/efex/code
# ln -sv /mnt/sdc1/dbx /home/efex/dbx
# ln -sv /mnt/sdc1/dbxlong /home/efex/dbxlong
# ln -sv /mnt/sdc1/dbx/docs /home/efex/docs
# ln -sv /mnt/sdc1/dbx/dots /home/efex/dots
# ln -sv /mnt/sdc1/dbxlong/music /home/efex/music
# ln -sv /mnt/sdc1/dbxlong/pics /home/efex/pics
# ln -sv /mnt/sdc1/dbx/proj /home/efex/proj
# ln -sv /mnt/sdc1/dbx/quant /home/efex/quant
# ln -sv /mnt/sdc1/dbx/dots/refs /home/efex/refs
# ln -sv /mnt/sdc1/dbx/dots/scripts /home/efex/scripts
# ln -sv /mnt/sdc1/dbx/tmp /home/efex/tmp
# ln -sv /mnt/sdc1/dbx/todo /home/efex/todo
# ln -sv /mnt/sdc1/dbxlong/vids /home/efex/vids
# ln -sv /mnt/sdc1/dbx/zackups /home/efex/zackups

source_dir="/home/efex/dots"
dest_dir="/home/efex"
dotfiles=(
  ".aliases"
  ".bash_logout"
  ".bash_profile"
  ".bashrc"
  ".dir_colors"
  ".fehbg"
  ".helpers"
  ".p10k.zsh"
  ".profile"
  ".tmux.conf"
  ".xinitrc"
  ".Xmodmap"
  ".zprofile"
  ".zshenv"
  ".zshrc"
)

for dot in ${dotfiles[@]}; do
  if [[ ! -f "$dest_dir/$dot" ]]; then
    ln -sv "$source_dir/$dot" "$dest_dir/$dot"
  elif [[ ! -f "$source_dir/$dot" ]]; then
    echo "no source file"
  elif [[ ! -f "$dest_dir/$dot" && ! -f "$source_dir/$dot" ]]; then
    echo "no dest or source"
    echo "$dot"
  fi
done
