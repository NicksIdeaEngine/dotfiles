#!/bin/bash

rmdir /home/efex/Documents
rmdir /home/efex/Pictures
rmdir /home/efex/Music
rmdir /home/efex/Videos
mv /home/efex/Downloads /home/efex/dwn

mkdir /mnt/sdc1/dbx/code
ln -s /mnt/sdc1/dbx/code /home/efex/code
ln -s /mnt/sdc1/dbx /home/efex/dbx
ln -s /mnt/sdc1/dbxlong /home/efex/dbxlong
mkdir /mnt/sdc1/dbx/docs
ln -s /mnt/sdc1/dbx/docs /home/efex/docs
ln -s /mnt/sdc1/dbx/dots /home/efex/dots
mkdir /mnt/sdc1/dbxlong/music
ln -s /mnt/sdc1/dbxlong/music /home/efex/music
mkdir /mnt/sdc1/dbxlong/pics
ln -s /mnt/sdc1/dbxlong/pics /home/efex/pics
mkdir /mnt/sdc1/dbx/proj
ln -s /mnt/sdc1/dbx/proj /home/efex/proj
mkdir /mnt/sdc1/dbx/quant
ln -s /mnt/sdc1/dbx/quant /home/efex/quant
ln -s /mnt/sdc1/dbx/dots/refs /home/efex/refs
ln -s /mnt/sdc1/dbx/dots/scripts /home/efex/scripts
mkdir /mnt/sdc1/dbx/tmp
ln -s /mnt/sdc1/dbx/tmp /home/efex/tmp
mkdir /mnt/sdc1/dbx/todo
ln -s /mnt/sdc1/dbx/todo /home/efex/todo
mkdir /mnt/sdc1/dbxlong/vids
ln -s /mnt/sdc1/dbxlong/vids /home/efex/vids
mkdir /mnt/sdc1/dbx/zackups
ln -s /mnt/sdc1/dbx/zackups /home/efex/zackups

ln -s /home/efex/dots/.aliases /home/efex/.aliases
ln -s /home/efex/dots/.bash_logout /home/efex/.bash_logout
ln -s /home/efex/dots/.bash_profile /home/efex/.bash_profile
ln -s /home/efex/dots/.bashrc /home/efex/.bashrc
ln -s /home/efex/dots/.dir_colors /home/efex/.dir_colors
ln -s /home/efex/dots/.fehbg /home/efex/.fehbg
ln -s /home/efex/dots/.helpers /home/efex/.helpers
ln -s /home/efex/dots/.p10k.zsh /home/efex/.p10k.zsh
ln -s /home/efex/dots/.profile /home/efex/.profile
ln -s /home/efex/dots/.tmux.conf /home/efex/.tmux.conf
ln -s /home/efex/dots/.xinitrc /home/efex/.xinitrc
ln -s /home/efex/dots/.Xmodmap /home/efex/.Xmodmap
ln -s /home/efex/dots/.zprofile /home/efex/.zprofile
ln -s /home/efex/dots/.zshenv /home/efex/.zshenv
ln -s /home/efex/dots/.zshrc /home/efex/.zshrc

ln -s /home/efex/dots/.config/i3 /home/efex/.config/i3
ln -s /home/efex/dots/.config/kitty /home/efex/.config/kitty
ln -s /home/efex/dots/.config/nvim /home/efex/.config/nvim
ln -s /home/efex/dots/.config/polybar /home/efex/.config/polybar
ln -s /home/efex/dots/.config/ranger /home/efex/.config/ranger
ln -s /home/efex/dots/.config/rofi /home/efex/.config/rofi
ln -s /home/efex/dots/.config/todo /home/efex/.config/todo
ln -s /home/efex/dots/.config/youtube-dl /home/efex/.config/youtube-dl
ln -s /home/efex/dots/.config/compton.airblader.conf /home/efex/.config/compton.airblader.conf
ln -s /home/efex/dots/.config/compton.conf /home/efex/.config/compton.conf

# ln -s /home/efex/dots/.mozilla/firefox/x.default-release/chrome /home/efex/.mozilla/firefox/x.default-release/chrome
