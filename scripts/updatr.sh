#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

. ~/.aliases

sudo pacman -Syu && paccache -r && paccache -ruk0 && \
  yay -Syu && notify-send --urgency=normal 'Pacman update complete!'

sudo snap refresh && notify-send --urgency=normal 'Snap refresh complete!'

pip freeze --local | \
  sed -rn 's/^([^=# \t\\][^ \t=]*)=.*/echo; \
  echo Processing \1 ...; pip install -U \1/p' | sh && \
  notify-send --urgency=normal 'Pip update complete!'

pip3 freeze --local | \
  sed -rn 's/^([^=# \t\\][^ \t=]*)=.*/echo; \
  echo Processing \1 ...; pip3 install -U \1/p' | sh && \
  notify-send --urgency=normal 'Pip3 update complete!'

