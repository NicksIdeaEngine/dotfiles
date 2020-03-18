#!/bin/zsh

# set all date variables
DAYOFMONTH="$(date +%d)"
MONTH="$(date +%-m)"
YEAR="$(date +%Y)"
QUARTER="$(( ($MONTH-1)/3+1 ))"

# destination folder in Dropbox
DEST="/mnt/sdc1/Dropbox/backups"

# directories to grab from $HOME
HOME_SPEC=(".config" ".config/google-chrome/Default" ".config/gtk-3.0" ".config/mpd" ".config/RescueTime.com" ".config/repos/st" ".config/todo" ".config/Twine" ".icons" ".local/kitty/kitty" ".local/share/applications" ".mozilla/firefox/sv5rklav.default-release" ".mozilla/firefox/wmmhtufq.dev-edition-default-2" ".ssh" ".tmux/plugins" ".vim" "bin" "Twine")

# .config specifications
CONFIG_SPEC=("autostart" "filezilla" "gtk-2.0" "gtk-4.0" "htop" "pulse" "vlc" "user-dirs.dirs")

# google chrome specific file
CHROME_SPEC=("Preferences")

# .config/gtk-3.0 spec
GTK_SPEC=("bookmarks")

# quarterly backups
QUARTER_SPEC=(".fonts" ".themes")

# mpd spec
MPD_SPEC=("mpd.conf" "pid")

# RescueTime.com spec
RESCUE_SPEC=(".rtgoals")

# st spec
ST_SPEC=(".Xdefaults" "config.h" "st.c" "st.info")

# todo spec
TODO_SPEC=(".actions.d" "todo_description.png")

# .config/twine spec
TWINE_SPEC=("prefs.json" "story-formats.json")

# .icon specifications
ICON_SPEC=("default" "st")

# specs for kitty terminal
LOCAL_KITTY_SPEC=("layout.py")

# specific directories to grab within .local/share/applications
LOCAL_APP_SPEC=("firefox-developer.desktop" "kitty.desktop" "twine.desktop" "st.desktop")

# .tmux/plugins spec
TMUX_SPEC=("tpm")

# .vim spec
VIM_SPEC=("autoload" ".netrwhist")

# dotfiles in $HOME
DOTFILES=(".bash_history" ".git-credentials" ".gitconfig" ".histfile" ".lesshst" ".node_repl_history" ".npmrc" ".nvimlog" ".python_history" ".rvmrc" ".selected_editor" ".viminfo" ".wakatime.cfg" ".wget-hsts" ".z" ".zsh_history")

# backup one or more files or directories
backup() {
  if [[ "$2" == "" ]]; then
    local SUB_DIR="$1"
    local HOME_DIR="$HOME"
  else
    local SUB_DIR="$1/$2"
    local HOME_DIR="$HOME/$2"
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
  # start by cycling through HOME_SPEC
  for I in "${HOME_SPEC[@]}"; do

    # then run backup() with extra sets of specific
    # directories if needed
    case "$I" in
      ".config" )
        backup "$1" "$I" "${CONFIG_SPEC[@]}" ;;
      ".config/google-chrome/Default" )
        backup "$1" "$I" "${CHROME_SPEC[@]}" ;;
      ".config/gtk-3.0" )
        backup "$1" "$I" "${GTK_SPEC[@]}" ;;
      ".config/mpd" )
        backup "$1" "$I" "${MPD_SPEC[@]}" ;;
      ".config/RescueTime.com" )
        backup "$1" "$I" "${RESCUE_SPEC[@]}" ;;
      ".config/repos/st" )
        backup "$1" "$I" "${ST_SPEC[@]}" ;;
      ".config/todo" )
        backup "$1" "$I" "${TODO_SPEC[@]}" ;;
      ".config/Twine" )
        backup "$1" "$I" "${TWINE_SPEC[@]}" ;;
      ".icons" )
        backup "$1" "$I" "${ICON_SPEC[@]}" ;;
      ".local/kitty/kitty" )
        backup "$1" "$I" "${LOCAL_KITTY_SPEC[@]}" ;;
      ".local/share/applications" )
        backup "$1" "$I" "${LOCAL_APP_SPEC[@]}" ;;
      ".mozilla/firefox/"* )
        backup "$1" "$I" "chrome" ;;
      ".tmux/plugins" )
        backup "$1" "$I" "${TMUX_SPEC[@]}" ;;
      ".vim" )
        backup "$1" "$I" "${VIM_SPEC[@]}" ;;
      * )
        backup "$1" "" "$I" ;;
    esac
  done

  # run backup() for DOTFILES
  backup "$1" "" "${DOTFILES[@]}"
}

start_quarterly() {
  backup "$1" "" "${QUARTER_SPEC[@]}"
}

# remove and remake directory, then add file to signal when that update was made
clean_dir() {
  rm -rf "$1"
  mkdir -p "$1"
  touch "$1/$2"
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

