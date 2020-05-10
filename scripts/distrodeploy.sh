#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

backup_src="$HOME/backups/current/"
backup_qtr="$HOME/backups/quarterly/1/"
dot_src="$HOME/dots/ubuntu"
dbox_src="/home/efex/dbx"

home_links=("archives" "backups" "body" "code" "docs" "dots" "flow" "music" "pics" "quant" "receipts" "refs" "scripts" "tmp" "todo" "vids" "writing")

remove_dirs=("Documents" "Music" "Pictures" "Videos")

deploy_home_links() {
#  if [[ ! -s /home/efex/dbx ]]; then
#    ln -s /mnt/sdc1/Dropbox /home/efex/dbx
#  fi

#  for i in ${home_links[@]}; do
#    if [[ ! -s $HOME/$i ]]; then
#      ln -s $dbox_src/$i $HOME/$i
#      echo "linked $HOME/$i to $dbox_src/$i"
#    fi
#  done

#  for i in ${remove_dirs[@]}; do
#    rm -vd "/home/efex/$i"
#  done

  mv /home/efex/Downloads /home/efex/dwn
  mv /home/efex/Documents /home/efex/docs
  mv /home/efex/Pictures /home/efex/pics
  mv /home/efex/Music /home/efex/music
  mv /home/efex/Videos /home/efex/vids
}

deploy_backup() {
  rsync -vahbEi --ignore-existing --backup-dir="$HOME/old" $backup_src $HOME
  rsync -vahbEi --ignore-existing --backup-dir="$HOME/old" $backup_qtr $HOME
}

deploy_dots() {
  cp -Rsb /home/efex/dots/manjaro/.* /home/efex/
}

deploy_repos() {
  local repodir="/home/efex/.local"
  if [[ ! -d $repodir ]]; then
    mkdir $repodir
  fi

  cd $repodir

  git clone git@github.com:a1wong/it87.git
  git clone git@github.com:LukeSmithxyz/st.git
  git clone git@github.com:kovidgoyal/kitty.git

}

start() {
  # Part X - Create file structure and links
  deploy_home_links

  # Part X - Put files from ~/backups into place
  deploy_backup
  cd ~/.fonts
  fc-cache

  # Part X - Create symlinks for everything in ~/dots/manjaro
  cd ~
  deploy_dots
}

start

