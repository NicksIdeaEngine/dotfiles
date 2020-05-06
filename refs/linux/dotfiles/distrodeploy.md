# Instructions on Deploying New Manjaro Install

**Summary:** An outline for deploying Manjaro-i3 along with all my configurations.

## Step 0: Pre Setup Notes

## Step 1: Installation

### SSD Partitioning

- For SWAP, allocate slightly more than max RAM
- At least 25Gb for `/`, or 30% of total drive space (whichever is larger), excluding `/home`
- the rest for `/home`

## Step 2: Initial Post-Install Setup

### Timeshift

- after initial update, immediately install Timeshift
  - `sudo pacman -Syu timeshift`
- set backups to desired drive
- run first manual backup
- set schedule to keep 7 daily and 6 monthly backups

### Distro Tweaks

- edits to `/etc/ssh/sshd_config`
  - LogLevel VERBOSE
  - PasswordAuthentication no
  - AllowTcpForwarding no
  - X11Forwarding no
  - AllowUsers <user>

## Step 3: Package Installation

### Rclone / Dropbox

- `sudo pacman -Syu rclone`
- Set up rclone/rsync and dropbox so that `$HOME/dbx` exists
  - `rclone config` to set it up
  - `rclone mount dbx:/ $HOME/dbx`

### Installs From Pacman

- `sudo pacman -Syu firefox neovim zsh st-manjaro rofi polybar feh youtube-dl curl wget nnn dunst neofetch firefox-developer-edition redshift ruby-sass ruby-sass-listen tmux wine gimp nodejs npm ruby virtualbox discord qbittorrent unrar pulseaudio perl-anyevent-i3 yay entr python-termcolor python-prettytable go yarn fzf rust cargo mpv mplayer mpd`

### Manual Installs

- repos:
  - dotfiles
  - ddgr-1.8.1
  - kitty
  - mps-youtube
  - navi
  - olWebsite-React
  - st
- oh-my-zsh
- powerlevel10k zsh theme
- powerline-fonts
- yay:
  - visual-studio-code-bin
  - google-chrome
  - i3-resurrect
  - rescuetime2
- snap:
  - slack
- pip3:
  - howdoi
  - gcalcli
- other:
  - todotxt-cli and plugins
  - vim-plug
- filezilla
- rescuetime (look into timewarrior and taskwarrior and vit, and rescuetime from yaourt)
- tor

#### Package Tweaks

- pynvim (for python3 and python2)

  - gem install neovim
  - npm install -g neovim
  - gem install --user neovim

- `kitty/layout.py`

```
cell_width = cell_height = 16
all_borders = Borders(False, False, False, False)
no_borders = Borders(True, True, True, True)
draw_minimal_borders = False
draw_active_borders = False
align_top_left = True

def layout_single_window(xdecoration_pairs: DecorationPairs, ydecoration_pairs: DecorationPairs, left_align: bool = True) -> WindowGeometry:
    xstart, xnum = next(layout_dimension(central.left, central.width, cell_width, xdecoration_pairs, left_align=True))
    ystart, ynum = next(layout_dimension(central.top, central.height, cell_height, ydecoration_pairs, left_align=True))
    return window_geometry(xstart, xnum, ystart, ynum)
```

## Step 4: Dotfiles, Backup, Home, & Repo Deploy

`distrodeploy.sh`

- st
- it87
- kitty

## Step 5: QA Checklist

- Kitty layout and spacing looks good
- i3 layout still shows correctly with zsh theme
- keyboard volume buttons work
- sinkswitch.sh works
- monitor positioning works on login
- `num_lock` is on upon login
- xset equivalent is tuned properly
- sysbackup.sh works
- workspaces set to correct monitors
- possibly re-setup ssh
- verify all backups are deployed
- all repos
- all dotfiles
- all symlinks for home and dotfiles

## Step 6: Make another snapshot

- Take a timeshift snapshot after this is done
