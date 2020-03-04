# Tmux basics

## Run tmux

\$ tmux

## Detach from tmux

\$ ctrl-space d

## Restore tmux session

\$ tmux attach

## Create new tmux session with name

\$ tmux new -s <session>

## Attach to named detached tmux session

\$ tmux a -t <session>

## Display tmux sessions

\$ tmux ls

## Rename session

$ ctrl-space $

## Switch session

\$ ctrl-space s

## Show tmux help screen (Q to quit)

\$ ctrl-space ?

## kill session

\$ tmux kill-session -t <session>

## kill server

\$ tmux kill-server

## resource ~/.tmux.conf

\$ ctrl-space r

# Tmux window management

## create new window in home directory

\$ ctrl-space c

## create new window in current directory

\$ ctrl-space w

## rename current window

\$ ctrl-space n

## destroy tmux pane/window

\$ ctrl-space x

## switch between windows

\$ ctrl-space [0-9]
\$ Alt-j/k for prev/next window

## switch between panes

\$ ctrl-space h/j/k/l

## open new pane to the side

\$ ctrl-space v

## open new pane below

\$ ctrl-space h

## enter copy mode

\$ ctrl-space [
\$ -> v: begin selection
\$ -> c: copy selection
\$ ctrl-space ]: paste from clipboard
\$ ctrl-shift-v: paste from clipboard (this is a kitty terminal hotkey, not tmux)

Another option for copying is to select with mouse and press y before releasing the mouse

# SUPER HELPFUL MAN PAGE KEY

Hit `K` to jump to the exact place in `man tmux` where the word under the cursor is explained

# Tmux Plugins

## installing plugins after adding to .tmux.conf

press `prefix` + `I`

## tmux-resurrect

* `prefix + Ctrl-s` to save
* `prefix + Ctrl-r` to restore

## tmux-contiuum


