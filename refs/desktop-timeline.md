# Timeline for Desktop

## Install

* 500Mb for `/boot`
* 150Gb for `/`
* 297.3Gb for `/home`
* 18Gb for `swap`

## Post Install

* updates
* wiped and formatted /dev/sdc, adding /dev/sdc1
* added `/dev/sdc1 /mnt/sdc1 ext4 defaults 1 2` to `/etc/fstab`
* install timeshift
* first manual snapshot
* fixing sensors issue via kubuntu forums post
	* mkdir .repos && cd .repos
	* git clone https://github.com/a1wong/it87.git
	* cd it87
	* sudo pacman -Syu dkms
	* will return to this later, might be an easier way via aur
* edit `/etc/ssh/sshd_config`
* installing packages: `firefox neovim st-manjaro rofi polybar feh youtube-dl nnn neofetch firefox-developer-edition redshift ruby-sass ruby-sass-listen tmux wine nodejs npm ruby discord qbittorrent unrar`
* cloning dotfiles repo into ~/dots
* installed ohmyzsh, powerlevel10k theme
* enabled xrandr via i3 config to orient monitors
* connected firefox to userChrome.css
* installed vim-plug for nvim and nvim plugins
* installed pulseaudio
* added pulseaudio startup and reload of polybar afterwards
* enabled pactl and audio hotkeys
* install perl-anyevent-i3 to fix i3-save-tree
* `gem install neovim`
* `npm install -g neovim`
* `gem install --user neovim`
* `pip install pynvim`
* enabled `xset dpms 0 0 1200` in i3 cnofig
* created `~/.config/redshift.conf` and added to i3 config autostart
* confirmed kitty/kitty/layout.py has right settings
* installing yay via pacman
* installing vscode via `yay visual-studio-code-bin`
* removed rclone mount (`/mnt/sdc1/dbx`) and will retry with proper permissions
* reran `rclone config` to setup dropbox, then ran `rclone mount dbx:/ /mnt/sdc1/dbx`
* installed entr plus updates
* installed slack via `sudo snap install slack --classic`
* removed palemoon-bin
* manually installed todotxt-cli
* installed python-termcolor
* installed python-prettytable
* installed go
* installed rtgoals
* installed obs-studio
* installed yarn

## Stuff To Look Into

* dropbox
* it87
* taskwarrior and timewarrior
* ruby-dev
* slack
* rvm
* twine
* filezilla
* rescuetime
* chrome
* tor
* set up rclone so that `/mnt/sdc1/Dropbox` exists
* set up sysbackup.sh
* set up ssh
* 
