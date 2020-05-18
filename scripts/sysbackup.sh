#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

# set all date variables
DAYOFMONTH="$(date +%d)"
MONTH="$(date +%-m)"
YEAR="$(date +%Y)"
QUARTER="$(( ($MONTH-1)/3+1 ))"

# destination folder in Dropbox
DEST="$HOME/zackups"

# directories to grab from $HOME
HOME_SPEC=(".config" ".config/google-chrome/Default" ".config/mpd" ".config/rclone" ".config/rescuetime" ".config/systemd/user" ".config/Twine" ".icons" ".local/share/applications" ".ssh" ".vim")

# .config specifications
CONFIG_SPEC=("autostart" "htop" "vlc" "redshift.conf" "user-dirs.dirs")

# google chrome specific file
CHROME_SPEC=("Preferences")

# mpd spec
MPD_SPEC=("mpd.conf")

# rclone spec
RCLONE_SPEC=("filter-from.txt" "rclone.conf")

# RescueTime.com spec
RESCUE_SPEC=(".rtgoals")

# systemd spec
SYSTEMD_SPEC=("dropbox-watch.service")

# .icon specifications
ICON_SPEC=("default" "st")

# specs for kitty terminal
# LOCAL_KITTY_SPEC=("layout.py")

# specific directories to grab within .local/share/applications
LOCAL_APP_SPEC=("firefox-developer.desktop" "kitty.desktop" "twine.desktop" "st.desktop")

# .vim spec
VIM_SPEC=("autoload")

# dotfiles in $HOME
DOTFILES=(".bash_history" ".git-credentials" ".gitconfig" ".histfile" ".lesshst" ".node_repl_history" ".npmrc" ".nvimlog" ".python_history" ".rvmrc" ".selected_editor" ".viminfo" ".wakatime.cfg" ".wget-hsts" ".Xclients" ".z" ".zsh_history")

# quarterly backups
QUARTER_SPEC=(".fonts" ".themes")

# backup one or more files or directories
backup() {
  local arg1="${1:-}"
  local arg2="${2:-}"

  if [[ "$arg2" == "" ]]; then
    local SUB_DIR="$arg1"
    local HOME_DIR="$HOME"
  else
    local SUB_DIR="$arg1/$arg2"
    local HOME_DIR="$HOME/$arg2"
  fi
  shift
  shift
  local ARR=("$@")

  for I in "${ARR[@]}"; do
    if [[ ! -d "$DEST/$SUB_DIR" ]]; then
      echo -n "Creating $SUB_DIR directory..."
      mkdir -p "$DEST/$SUB_DIR"
      echo "done!"
    fi
    echo -n "Backing up $I to $DEST/$SUB_DIR..."
    cp -rup -t "$DEST/$SUB_DIR" "$HOME_DIR/$I"
    echo "done!"
  done
}

start_daily() {
  local arg1="${1:-}"

  # start by cycling through HOME_SPEC
  for I in "${HOME_SPEC[@]}"; do

    # then run backup() with extra sets of specific
    # directories if needed
    case "$I" in
      ".config" )
        backup "$arg1" "$I" "${CONFIG_SPEC[@]}" ;;
      ".config/google-chrome/Default" )
        backup "$arg1" "$I" "${CHROME_SPEC[@]}" ;;
      ".config/mpd" )
        backup "$arg1" "$I" "${MPD_SPEC[@]}" ;;
      ".config/rclone" )
        backup "$arg1" "$I" "${RCLONE_SPEC[@]}" ;;
      ".config/rescuetime" )
        backup "$arg1" "$I" "${RESCUE_SPEC[@]}" ;;
      ".config/systemd/user" )
        backup "$arg1" "$I" "${SYSTEMD_SPEC[@]}" ;;
      ".config/Twine" )
        backup "$arg1" "$I" "${TWINE_SPEC[@]}" ;;
      ".icons" )
        backup "$arg1" "$I" "${ICON_SPEC[@]}" ;;
      ".local/kitty/kitty" )
        backup "$arg1" "$I" "${LOCAL_KITTY_SPEC[@]}" ;;
      ".local/share/applications" )
        backup "$arg1" "$I" "${LOCAL_APP_SPEC[@]}" ;;
      ".vim" )
        backup "$arg1" "$I" "${VIM_SPEC[@]}" ;;
      * )
        backup "$arg1" "" "$I" ;;
    esac
  done

  # run backup() for DOTFILES
  backup "$arg1" "" "${DOTFILES[@]}"
}

start_quarterly() {
  local arg1="${1:-}"
  backup "$arg1" "" "${QUARTER_SPEC[@]}"
}

# remove and remake directory, then add file to signal when that update was made
clean_dir() {
  local arg1="${1:-}"
  local arg2="${2:-}"
  rm -rf "$arg1"
  mkdir -p "$arg1"
  touch "$arg1/$arg2"
  echo "Created $arg1/$arg2"
}

# check for signal file to see if update is needed
if [[ ! -f "$DEST/$DAYOFMONTH/$MONTH" ]]; then
  clean_dir "$DEST/$DAYOFMONTH" "$MONTH"
  start_daily "$DAYOFMONTH"
  DAILY_MSG="Rotating daily backup completed."
else
  DAILY_MSG="Rotating daily backup not needed."
fi

if [[ ! -f "$DEST/current/$DAYOFMONTH" ]]; then
  clean_dir "$DEST/current" "$DAYOFMONTH"
  start_daily "current"
  CURRENT_MSG="Current daily backup completed."
else
  CURRENT_MSG="Current daily backup not needed."
fi

if [[ ! -f "$DEST/quarterly/$QUARTER/$YEAR" ]]; then
  clean_dir "$DEST/quarterly/$QUARTER" "$YEAR"
  start_quarterly "quarterly/$QUARTER"
  QUARTER_MSG="Quarterly backup completed."
else
  QUARTER_MSG="Quarterly backup not needed."
fi

notify-send "$DAILY_MSG"$'\n'"$CURRENT_MSG"$'\n'"$QUARTER_MSG"
