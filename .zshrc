# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/home/efex/.oh-my-zsh"

# enable completion
autoload -Uz compinit
compinit

# enable navi
source <(navi widget zsh)

# enable fzf with default options
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border=sharp --color='bg:237,bg+:236,info:143,border:240,spinner:108,hl:65,fg:252,header:65,fg+:252,pointer:161,marker:168,prompt:110,hl+:108' --tabstop=2"

export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# VIM in shell
# set editing-mode vi

# Set theme. See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# remove extra space on right
ZLE_RPROMPT_INDENT=0

# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Standard plugins: ~/.oh-my-zsh/plugins/* | Custom plugins: ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(catimg colored-man-pages command-not-found frontend-search fzf git npm vi-mode vscode z)

export FRONTEND_SEARCH_FALLBACK='duckduckgo'

# zstyle :omz:plugins:ssh-agent agent-forwarding on
# zstyle :omz:plugins:ssh-agent lifetime 2h

source $ZSH/oh-my-zsh.sh

# enable color support of ls and add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto --group-directories-first'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# # ex - archive extractor
# # usage: ex <file>
ex () {
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.tar.xz)    tar xJf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Load zprofile
[[ -f ~/.zprofile ]] && . ~/.zprofile

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Adding local gem bin path
export PATH="/home/efex/.gem/ruby/2.7.0/bin:$PATH"
