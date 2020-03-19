#!/bin/zsh

srcdir="$HOME/backups/current"
quarterly="$HOME/backups/quarterly"
home="$HOME"

deploy() {

}

dig() {

}

check() {
}

start() {
  cd $1
  if [[ "$(ls -A $1)" ]]; then
    ls -ad .*
  fi
}

start $srcdir
