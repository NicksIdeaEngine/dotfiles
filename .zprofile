# Load aliases
[[ -f ~/.aliases ]] && . ~/.aliases

# Load functions
[[ -f ~/.helpers ]] && . ~/.helpers

# Ubuntu make installation of Ubuntu Make binary symlink
PATH=/home/efex/.local/share/umake/bin:$PATH

