# Installation Timeline

- Ubuntu 19.10
- Timeshift > take snapshot
- i3-gaps
- Firefox userChrome.css
- vim
- fonts-powerline
- zsh
- oh-my-zsh
- st with gruvbox-light theme
- .Xmodmap for caps key config
- .aliases
- make
- autoconf
- automake
- pkg-config
- flex
- bison
- check
- libpango
- libpangocairo
- libcairo
- libcairo-xcb
- python-pip
- cairo
- python
- xcb-proto
- xcb-util-image xcb-util-wm
- libpulse-dev
- libjsoncpp1
- libmpdclient-dev libmpdclient2
- libnl-genl-3-dev
- cmake
- xcb-composite
- libxcb-composite0
- python-xcbgen
- libreoffice
- Dropbox
- Powerline Fonts
- PowerLevel10k zsh theme
- rofi
- ranger
- .fonts directory
- Polybar
- feh
- Chrome
- VS Code
- Vimium
- .Xresources
- ssh
- youtube-dl
- ffmpeg
- ffprobe
- curl
- VLC
- Dropbox
- atomicparsley
- nemo
- libtool
- python-gtk2
- docutils-common
- dunst
- libnotify-dev
- i3ass
- libxss-dev
- gawk
- xdotool
- neofetch
- libanyevent-i3-perl
- wmctrl
- rescuetime
- ubuntu-make
- firefox-dev
- gucharmap
- xflux
- webdev stuff!
- scss/sass
- filezilla
- tmux
- wine
- twine
- mpd
- mpc
- htop
- gimp
- hashalot
- nodejs
- npm
- ruby
- rvm
- virtualbox
- i3lock
- weechat
- gnome-tweak-tool
- gnome-shell-extensions
- slack
- discord
- oomox_1.12.5_18.10+.deb
- lxappearance
- gparted
- qbittorrent
- fancontrol
- libtool-bin
- ninja-build
- neovim (nvim)
- pynvim (for python3)
- pynvim (for python2)
- ruby-dev
- gem install neovim
- npm install -g neovim
- gem install --user neovim
- python3-pygments
- kitty
- libconfig9
- libgl1-mesa-glx
- asciidoc
- libconfig-dev
- compton
- xsel
- adb
- fastboot
- live-build
- cdebootstrap
- devscripts
- installed kali archive keyring and live-build packages to /root/
  - `wget http://http.kali.org/pool/main/k/kali-archive-keyring/kali-archive-keyring_2018.2_all.deb`
  - `wget https://archive.kali.org/kali/pool/main/l/live-build/live-build_20191221_all.deb`
  - `sudo apt install -y git live-build cdebootstrap debootstrap curl`
  - `sudo dpkg -i kali-archive-keyring_2018.2_all.deb`
  - `sudo dpkg -i live-build_20191221_all.deb`
  - `cd /usr/share/debootstrap/scripts/`
  - `echo "default_mirror http://http.kali.org/kali"; sed -e "s/debian-archive-keyring.gpg/kali-archive-keyring.gpg/g" sid > /tmp/kali`
  - `sudo mv /tmp/kali .`
  - `sudo ln -s kali kali-rolling`
- attempting to fix lm-sensors problem where `cpu_fan` always shows "0 RPM"
  - [Solution Found Here](https://www.kubuntuforums.net/showthread.php/74401-Driver-for-Asus-B450-motherboard-to-enable-LM-Sensors-other-boards)
  - `sudo demidecode -t 34`
    - This identifies chipset that provides info to lm-sensors
  - `echo "it87" | sudo tee -a /etc/modules`
  - `sudo apt install git dkms build-essential linux-headers-generic`
  - `cd ~/.config/repos`
  - `git clone https://github.com/a1wong/it87.git`
  - `cd it87/`
  - `sudo make dkms`
  - `sensors`
- scrot
- prettytable (pip)
- termcolor (pip)
-

# Ideas

The mindset behind this setup is rapid web development and research through a minimal, nearly-max real estate UI. Crisp, crystal clear, and low on eye strain.

# Things to Investigate

- xcape
- chef
- cfengine
- puppet
- ansible
- tmuxp
- Hiren's BootCD
- UltimateBootCD
- putty
- [PortableApps](https://portableapps.com/)
- Yumi for multi boot
- rolling my own Kali Linux on a flash drive
- less /etc/default/grub
  - shows grub config
- df -ht ext4
  - list mounted ext4 filesystems
- lsblk | grep sd
  - list block devices, filter with "sd"
- dmesg | grep wl
  - print kernal ring buffer, filter with "wl" to show network devices
- [PenTesters Framework](https://github.com/trustedsec/ptf)
- Notes Up
- Dashlane
- pCloud
-

## Tools for Creating Your Own Linux Distro

- Linux Respin
- Linux Live Kit
- Linux From Scratch
- Live Magic

# Notes

## Desktop Specs

### Fan Setup

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

### Looking at fan speeds and system temperatures

## Script ideas

- File integrity checker: Keep a database of important file md5sum's and check those files daily to see if they have changed. If they have changed, have it alert you via mail. E.g., simplified Tripwire clone.
- Backup script: Maintains up to 10 days worth of daily backups
- RSS reader
- Auto-update function: Write any script but include a function that checks itself for updates. Example: Host the script on github and have it check the md5sum of the current file being run against the md5sum of the script on github. If the file is changed, show a prompt asking the user if he wants to update. If yes download the latest script and replace the current one.
- Image uploader
- Create a CLI interface
- Music organizer: Parse all of your music files and replace spaces with "\_" or "\-" and keep them in the same format. Example: if a music file is mpg convert it to mp3 automatically.
- Switches: Implement switches for the previous scripts. Example: instead of using mp3 as the final format in the music organizer, perhaps you could pass: --format mp4
- Send Command: Write a script that accepts a screen/tmux session name will send the same command to all windows inside the provided session.
- Script to unzip any type of compressed file

## Notes from "Your Linux Toolbox" Zine Collection

Created by [Julia Evans](https://jvns.ca/)

### Linux Diagnostic Stuff to Check Out

- dstat (-t)
- strace (-e open -p PID)
- opensnoop
- netcat (alias 'nc'?)
- ifconfig
- netstat (sudo netstat -tunapl) !! tuna, please!
- ngrep (sudo ngrep -d any metafilter)
- tcpdump (sudo tcpdump port 8997 -w service.pcap)
  - sudo tcpdump port 80 -w http.pcap
    - then (wireshark http.pcap)
  - \* [What is metafilter.com?](metafilter.com)
- perf (sudo perf record python) (end after a few seconds)
  - sudo perf top
  - for node development, use --perf-basic-prof
- valgrind
- ftrace
- flamegraph
- perf stat ls

### tcpdump

- sudo tcpdump -n -i any port 53
- sudo tcpdump -n -i any port 53 and host 1.2.3.4
- sudo tcpdump 'udp[11]&0xf==3'
- ssh some.remote.host tcpdump -pni any -w --s0 -U port 8888 | wireshark -k -i
- Useful arguments:
  - -i (interface! use -i any)
  - -w (write)
  - -c (count)
  - -A (all packet contents) (ngrep is better than tcpdump -A)
  - -n (force IP printing instead of hostname)
  - -e (ethernet! includes MAC address in printout)
  - -p (filter packets only to/from your IP)
- commands to check out that are cool networking tools
  - ping
  - dig/nslookup
  - netstat/ss
  - ifconfig
  - ip
  - arp
  - ngrep
  - tracerout/mtr
  - nc
  - sysctl
  - nftables/iptables
  - ethtool
  - nmap
  - whois
  - lsof
  - telnet
  - ssh
  - stunnel
  - network manager
  - paping
  - openvpn
  - socat
  - nethogs/ab/nload
  - iftop/netsniff-ng
  - iptraf/netperf/iperf

#### So You Want To Be A Wizard

##### How to be a Wizard Programmer

- Ask questions. Dumb questions. Scary-to-ask questions. They'll get less dumb FAST.
- Run into problems you (and/or your team) don't know how to solve. It's okay.
- Decide you'll figure it out anyways.

##### When to invest in understanding?

- When you're trying to debug a tricky problem.
- - Maybe it's the libraries/dependencies that have bugs?
- When you're pushing the limits / optimizing performance
- When trying to innovate

##### Asking good questions

- A good question is easy for the person to answer and gets you the info you need.
- State what you know.
- Guess at what the answer might be.
- Choose who to ask.
- Find a good time.
- Do some research.
- Ask yes/no questions.

##### Read the source code

Sometimes there's no documentation, or coworkers are busy, or they don't know the answer, or you want way more information.

##### Tips for reading code

- grep for the error message
- Just read all the code
- edit the code to see what happens
- Step through with a debugger.
- Add tests.
- Add print statements.
- Introduce bugs.
- Experiment.
- Don't always trust the comments.

##### Debugging: Love Your Bugs

Debugging is a great way to learn. Often reveals problems with your mental model. You'll learn how to write more reliable code.

You get to solve a mystery while having immediate feedback about whether you are right or not!

###### Improving your debugging

- Overview
  - Remember that bugs happen for logical reasons.
  - Be confident about solving the problem
  - Talk to coworkers
  - Know your debug toolkit
  - Learn to like it. You'll be doing it a lot. It's a new puzzle!
- Learning at work
  - Follow up on bugs you couldn't figure out
  - Volunteer to do work that seems hard
  - Pay attention to others' code
  - Watch more senior people operate
- Learning on your own
  - Conferences
  - Pick a concept and spend 3 hours on it
  - Read a paper
  - Teach/blog it
  - Implement something that seems hard
  - Try a new tool
  - Do experiments

#### Profiling & Tracing With Perf

perf lets you trace system calls faster than strace, profile your C / Go / C++ / Node.js / Rust / Java&JVM programs easily, and trace or count almost any kernel event

- \$ sudo perf top
  - Finds out how much CPU every function is using
- \$ sudo perf record
  - Lets you save the data to investigate further via perf.data in current directory
- \$ sudo perf record COMMAND (profile COMMAND until it exits)
- \$ " " " PID (profile PID until you press ctrl+c)
- \$ " " " -a (profile every process until ctrl+c)
- \$ " " " -p PID COMMAND (hybrid) (example: sudo perf record -p 8325 sleep 5)

## Notes from The Linux Command Line Book

### Useful Commands To Remember

#### Chapter 1

- `date`
- `cal`
- `df`
- `free`
- `ctrl+alt+f1`: seems to return me to the Ubuntu login screen
- `ctrl+alt+f2`: puts me back into the Ubuntu GUI
- `ctrl+alt+f3/f4/f5/f6`: gives me tty3/4/5/6 terminals
- `ctrl+alt+f7`: gives me a screen that doesn't accept input which has `/dev/sda3: clean, XXXX/XXXX files, XXXX/XXXX blocks`

#### Chapter 2

- `pwd`
- `cd`
- `ls`
- absolute paths: `/usr/bin`
- relative paths: `./bin` or `../dev`
  - single period `./` refers to current directory, double period `../` refers to parent directory
