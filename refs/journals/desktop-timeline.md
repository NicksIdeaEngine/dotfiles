# Timeline for Desktop

- **Summary:** This is an ongoing list of stuff I've installed or done to my desktop system-wise.

## Install

- 500Mb for `/boot`
- 150Gb for `/`
- 297.3Gb for `/home`
- 18Gb for `swap`

## Fan Setup

- CPU fan: Cooler Master 82.9 CFM (fan1)
  - Cooler Master 82.9 CFM 120mm
  - Speed: 600 - 2000 RPM
- Fan1: front fan, inflow (fan2)
  - Phanteks 200mm (PH-F200) 110.1 CFM
  - 250 - 850 RPM
- Fan2: top fans, outflow (fan3)
  - 2x Cooler Master SickleFlow 69 CFM 120mm
  - Speed: 0 - 2000 RPM
- Fan3: bottom fans, inflow (fan4)
  - 2x Cooler Master SickleFlow 69 CFM 120mm
  - Speed: 0 - 2000 RPM
- AIO Pump: back fan, outflow (fan6)
  - Phanteks 140mm (PH-F140) 78.1 CFM
  - 0 - 1200 RPM
- GPU Fans
  - Nitro+ RX 590 8G G5
  - Nominal fan speed 0 - 2280 (max is 3200)

## Post Install

- updates
- wiped and formatted /dev/sdc, adding /dev/sdc1
- added `/dev/sdc1 /mnt/sdc1 ext4 defaults 1 2` to `/etc/fstab`
- install timeshift
- first manual snapshot
- fixing sensors issue via kubuntu forums post (_Apr24/2020:_ did not complete, still needs investigating)(_May1/2020:_ Completed! Refer to line 68)
  - `mkdir .repos && cd .repos`
  - `git clone https://github.com/a1wong/it87.git`
  - `cd it87`
  - `sudo pacman -Syu dkms` \* will return to this later, might be an easier way via aur
- edit `/etc/ssh/sshd_config`
- installing packages: `firefox neovim st-manjaro rofi polybar feh youtube-dl nnn neofetch firefox-developer-edition redshift ruby-sass ruby-sass-listen tmux wine nodejs npm ruby discord qbittorrent unrar`
- cloning dotfiles repo into ~/dots
- installed ohmyzsh, powerlevel10k theme
- enabled xrandr via i3 config to orient monitors
- connected firefox to userChrome.css
- installed vim-plug for nvim and nvim plugins
- installed pulseaudio
- added pulseaudio startup and reload of polybar afterwards
- enabled pactl and audio hotkeys
- install perl-anyevent-i3 to fix i3-save-tree
- `gem install neovim`
- `npm install -g neovim`
- `gem install --user neovim`
- `pip install pynvim`
- enabled `xset dpms 0 0 1200` in i3 cnofig
- created `~/.config/redshift.conf` and added to i3 config autostart
- confirmed kitty/kitty/layout.py has right settings
- installing yay via pacman
- installing vscode via `yay visual-studio-code-bin`
- removed rclone mount (`/mnt/sdc1/dbx`) and will retry with proper permissions
- reran `rclone config` to setup dropbox, then ran `rclone mount dbx:/ /mnt/sdc1/dbx`
- installed entr plus updates
- installed slack via `sudo snap install slack --classic`
- removed palemoon-bin
- manually installed todotxt-cli
- installed python-termcolor
- installed python-prettytable
- installed go
- installed rtgoals
- installed obs-studio
- installed yarn
- installed fzf
- installed rust
- installed cargo
- manually installed navi to ~/.local
- manually installed mps-youtube to ~/.local
- installed mpv
- installed mplayer
- installed mpd
- manually installed ddgr
- installed howdoi (pip3)
- installed gcalcli (pip3)
- installed i3-resurrect (yay)
- second attempt at fixing sensors issue via [kubuntu forums post](https://www.kubuntuforums.net/showthread.php/74401-Driver-for-Asus-B450-motherboard-to-enable-LM-Sensors-other-boards)
  - `sudo dmidecode -t 34` gives me "ITE IT8665E" for description
  - `echo "it87" | sudo tee -a /etc/modules`
  - `cd ~/.local`
  - `git clone https://github.com/a1wong/it87.git`
  - `cd it87/`
  - `sudo make dkms` (**error**:
    - install `linux54-headers`
    - then reboot
    - then `sudo make dkms_clean`
    - then this worked)
  - `sensors` now works!
- enabled polybar modules for fans
- **UNDOING** the attempted sensors fix from line 68 and 19
  - disabling polybar modules temporarily
  - `cd ~/.local/it87` && `sudo make dkms_clean`
  - removed "it87" from `/etc/modules`
  - removed `~/.local/it87`
  - rebooted
- installed python-prettytable again
- rescuetime2 (yay)
- installed the_silver_searcher
- installed nethack
- removed `mps-youtube` from `~/.local`
- installed mps-youtube via pacman
- uninstalled mps-youtube from pacman
  - this doesn't work due to problem with mpv, and the main packages aren't being maintained
  - the development branch of mps-youtube github repo works
- installed mps-youtube development branch to `~/.local`
- installed flake8 via `python -m pip install flake8`
- installed `black` via `pip`
- installed ack

## New Things To Explore

- ncmpcpp or ncmpc (goal of streaming youtube audio without browser)
- mpd/mpv (or manjaro equivalent)

## Packages to Install

- taskwarrior
- timewarrior
- twine
- filezilla
- tor
- ruby-dev
- rvm

## Problems & Ideas to Ponder

- `:cleanhealth` in nvim shows something wrong with python2
- list of apps to create an i3 hotkey for
  - mps-youtube launching inside of kitty (possibly resized and floating?)
  -
