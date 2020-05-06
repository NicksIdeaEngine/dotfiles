# Instructions on Deploying New Manjaro Install

**Summary:** This was an outline made and used for migrating my desktop from Ubuntu to Manjaro-i3. It covers some specific hardware needs along with most of the packages I use.

## Step 0: Pre Setup Notes

### Test These Things With Live USB

- lm-sensors problem

## Step 1: Installation

### SSD Partitioning

- 18432Mb for SWAP
- 102400Mb to 153600Mb for `/` excluding `/home`
- the rest for `/home`

## Step 2: Initial Post-Install Setup

### Timeshift

- after initial update, immediately install Timeshift
- set backups to `/mnt/sdc1`
- run first manual backup
- set schedule to keep 7 daily and 6 monthly backups

### Distro Tweaks

- attempting to fix lm-sensors problem where `cpu_fan` always shows "0 RPM"
  - [Solution Found Here](https://www.kubuntuforums.net/showthread.php/74401-Driver-for-Asus-B450-motherboard-to-enable-LM-Sensors-other-boards)
  - `sudo dmidecode -t 34`
    - This identifies chipset that provides info to lm-sensors
  - `echo "it87" | sudo tee -a /etc/modules`
  - `sudo apt install git dkms build-essential linux-headers-generic`
  - `cd ~/.config/repos`
  - `git clone https://github.com/a1wong/it87.git`
  - `cd it87/`
  - `sudo make dkms`
  - `sensors`
- edits to `/etc/ssh/sshd_config`
  - LogLevel VERBOSE
  - PasswordAuthentication no
  - AllowTcpForwarding no
  - X11Forwarding no
  - AllowUsers <user>

## Step 3: Package Installation

### Rclone / Dropbox

- Set up rclone/rsync and dropbox so that /mnt/sdc1/Dropbox exists

### Installs From Pacman

- `sudo pacman -Syu timeshift firefox neovim zsh st-manjaro rofi polybar feh youtube-dl curl wget nnn dunst neofetch firefox-developer-edition redshift ruby-sass ruby-sass-listen tmux wine gimp nodejs npm ruby virtualbox discord qbittorrent unrar`

### Manual Installs

- ruby-dev
- slack
- rvm
- twine
- filezilla
- rescuetime (look into timewarrior and taskwarrior and vit, and rescuetime from yaourt)
- chrome
- vs code
- dropbox (look into rclone)
- powerlevel10k zsh theme
- oh-my-zsh
- powerline-fonts
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
