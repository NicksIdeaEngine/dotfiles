# Tmux basics

- `tmux` - Run tmux
- `ctrl-space d` - Detach from tmux
- `tmux attach` - Restore tmux session
- `tmux new -s <session>` - Create new tmux session with name
- `tmux a -t <session>` - Attach to named detached tmux session
- `tmux ls` - Display tmux sessions
- `ctrl-space $` - Rename session
- `ctrl-space s` - Switch session
- `ctrl-space ?` - Show tmux help screen (Q to quit)
- `tmux kill-session -t <session>` - kill session
- `tmux kill-server` - kill server
- `ctrl-space r` - resource ~/.tmux.conf

# Tmux window management

- `ctrl-space c` - create new window in home directory
- `ctrl-space w` - create new window in current directory
- `ctrl-space n` - rename current window
- `ctrl-space x` - destroy tmux pane/window
- `ctrl-space [0-9]` - switch between windows
- `Alt-j/k` - for prev/next window
- `ctrl-space h/j/k/l` - switch between panes
- `ctrl-space v` - open new pane to the side
- `ctrl-space h` - open new pane below

* `ctrl-space [` - enter copy mode
* `-> v:` begin selection
* `-> c:` copy selection
* `ctrl-space ]:` paste from clipboard
* `ctrl-shift-v: paste` from clipboard (this is a kitty terminal hotkey, not tmux)

Another option for copying is to select with mouse and press y before releasing the mouse

# SUPER HELPFUL MAN PAGE KEY

Hit `K` to jump to the exact place in `man tmux` where the word under the cursor is explained

# Tmux Plugins

- `` prefix` + `I `` - installing plugins after adding to .tmux.conf

- `prefix + Ctrl-s` to save - tmux-resurrect
- `prefix + Ctrl-r` to restore

## tmux-contiuum
