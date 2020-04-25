#
# ~/.bashrc
#

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --group-directories-first'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

[[ -f ~/.aliases ]] && . ~/.aliases

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# [ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# # Change the window title of X terminals
# case ${TERM} in
# 	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
# 		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
# 		;;
# 	screen*)
# 		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
# 		;;
# esac

# use_color=true

# # Set colorful PS1 only on colorful terminals.
# # dircolors --print-database uses its own built-in database
# # instead of using /etc/DIR_COLORS.  Try to use the external file
# # first to take advantage of user additions.  Use internal bash
# # globbing instead of external grep binary.
# safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
# match_lhs=""
# [[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
# [[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
# [[ -z ${match_lhs}    ]] \
# 	&& type -P dircolors >/dev/null \
# 	&& match_lhs=$(dircolors --print-database)
# [[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

# if ${use_color} ; then
# 	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
# 	if type -P dircolors >/dev/null ; then
# 		if [[ -f ~/.dir_colors ]] ; then
# 			eval $(dircolors -b ~/.dir_colors)
# 		elif [[ -f /etc/DIR_COLORS ]] ; then
# 			eval $(dircolors -b /etc/DIR_COLORS)
# 		fi
# 	fi

# 	if [[ ${EUID} == 0 ]] ; then
# 		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
# 	else
# 		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
# 	fi

# 	alias ls='ls --color=auto'
# 	alias grep='grep --colour=auto'
# 	alias egrep='egrep --colour=auto'
# 	alias fgrep='fgrep --colour=auto'
# else
# 	if [[ ${EUID} == 0 ]] ; then
# 		# show root@ when we don't have colors
# 		PS1='\u@\h \W \$ '
# 	else
# 		PS1='\u@\h \w \$ '
# 	fi
# fi

# unset use_color safe_term match_lhs sh

# alias cp="cp -i"                          # confirm before overwriting something
# alias df='df -h'                          # human-readable sizes
# alias free='free -m'                      # show sizes in MB
# alias np='nano -w PKGBUILD'
# alias more=less

# xhost +local:root > /dev/null 2>&1

# complete -cf sudo

# # Bash won't get SIGWINCH if another process is in the foreground.
# # Enable checkwinsize so that bash will check the terminal size when
# # it regains control.  #65623
# # http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
# shopt -s checkwinsize

# shopt -s expand_aliases

# # export QT_SELECT=4

# # Enable history appending instead of overwriting.  #139609
# shopt -s histappend
