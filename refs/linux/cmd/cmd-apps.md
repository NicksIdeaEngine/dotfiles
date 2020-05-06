# Command Line Applications

## Currently Installed

- zsh
  - framework: oh-my-zsh
  - theme: powerlevel10k
  - plugins:
    - catimg
    - command-not-found
    - git
    - npm
    - vi-mode
    - vscode
    - z
- vimwiki
- [nvim](https://neovim.io/)
- [tmux](https://github.com/tmux/tmux/wiki)
- [ranger](https://ranger.github.io/)
- [kitty](https://sw.kovidgoyal.net/kitty/#quickstart)
- [simple terminal](https://st.suckless.org/)
- [fzf](https://github.com/junegunn/fzf)
- [navi](https://github.com/denisidoro/navi)
  - `navi --help`
  - `navi repo browse`
  - `navi repo add <githubURL>`
  - `Ctrl+G` to launch navi
- hexchat
- [htop](https://hisham.hm/htop/)
- mpd
- mps-youtube
  - `mpsyt` to launch
- [neofetch](https://github.com/dylanaraps/neofetch)
- [nnn](https://github.com/jarun/nnn)
- systemd
- todotxt-cli
- youtube-dl
- moc
- [ddgr](https://github.com/jarun/ddgr):
  - `ddgr <query>`
- [howdoi](https://github.com/gleitz/howdoi)
  - `how <query>` to use
  - `how` to show options
- [jq.node](https://github.com/FGRibreau/jq.node)
  - these 4 commands do the same thing
  - `cat users.json | jqn 'filter(has("email")) | groupBy(function(u){return u.email.split("@")[1]}) | csv'`
  - `cat users.json | jqn 'filter(has("email")) | groupBy(u => u.email.split("@")[1]) | csv'`
  - `cat users.json | jqn 'filter(has("email")) | groupBy(u => get(u.email.split("@"), 1)) | csv'`
  - `cat users.json | jqn 'filter(has("email")) | groupBy(flow(get("email"), split("@"), get(1))) | csv'`
  - supports [lodash/fp](https://github.com/lodash/lodash/wiki/FP-Guide)
- [gcalcli](https://github.com/insanum/gcalcli)

## Potential Installs

- [ttrv - tilde terminal reddit viewer](https://github.com/tildeclub/ttrv)
- [timewarrior](https://timewarrior.net/)
- [taskwarrior](https://taskwarrior.org/)
