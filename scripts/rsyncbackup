#!/bin/zsh

# directory to backup
SRCDIR=$HOME/.config/autostart

# the backup location
DEST=/mnt/sdc1/Dropbox/backups

FILES=$DEST/unix/rsynclist

BACKUPDIR=`date +%d`
# OPTS="--force --ignore-errors --include-from=$FILES --delete --backup --backup-dir=$DEST/$BACKUPDIR -vuLKpEt"
OPTS="-vrupEt --include-from=$FILES"

# the following line clears the last weeks incremental directory
[[ -d $HOME/emptydir ]] || mkdir $HOME/emptydir
rsync --delete -a $HOME/emptydir/ $DEST/$BACKUPDIR/
rmdir $HOME/emptydir

# now the actual transfer
rsync $OPTS $SRCDIR $DEST/current
rsync $OPTS $SRCDIR $DEST/$BACKUPDIR
