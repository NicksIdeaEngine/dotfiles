# Run tmux
$ tmux
# Detach from tmux
$ ctrl-b d
# Restore tmux session
$ tmux attach
# Create new tmux session with name
$ tmux new -s test
# Attach to named detached tmux session
$ tmux a -t test
# Display tmux sessions
$ tmux ls
# Rename session
$ ctrl-b $
# Switch session
$ ctrl-b s
# Show tmux help screen (Q to quit)
$ ctrl-b ?
# Tmux window management
## create new window
$ ctrl-b c
## destroy tmux window
$ ctrl-b x
## switch between windows
$ ctrl-b [0-9] or ctrl-b arrows
## split windows horizontally
$ ctrl-b %
## split windows vertically
$ ctrl-b "

