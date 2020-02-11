# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Add rvm secure path export
export rvmsudo_secure_path=1

# Path to your oh-my-zsh installation.
export ZSH="/home/efex/.oh-my-zsh"

# Move GOPATH into $DBOX/code/go
export GOPATH="$HOME/code/go"

# enable todo completion while using the `t` alias
# complete -F _todo t

# Set theme. See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=powerlevel10k/powerlevel10k

# remove extra space on right
ZLE_RPROMPT_INDENT=0

# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Standard plugins: ~/.oh-my-zsh/plugins/* | Custom plugins: ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(catimg command-not-found git npm vi-mode vscode z)

source $ZSH/oh-my-zsh.sh

# enable color support of ls and add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto --group-directories-first'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# Load zprofile
[[ -f ~/.zprofile ]] && . ~/.zprofile

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Adding local gem bin path
export PATH="/home/efex/.gem/ruby/2.5.0/bin:$PATH"
