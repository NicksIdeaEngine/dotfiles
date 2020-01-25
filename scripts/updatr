#!/bin/zsh

. ~/.aliases

sudo apt update && sudo apt upgrade && alert 'Apt update and upgrade complete!'

sudo snap refresh && alert 'Snap refresh complete!'

pip freeze --local | sed -rn 's/^([^=# \t\\][^ \t=]*)=.*/echo; echo Processing \1 ...; pip install -U \1/p' | sh && alert 'Pip update complete!'

pip3 freeze --local | sed -rn 's/^([^=# \t\\][^ \t=]*)=.*/echo; echo Processing \1 ...; pip3 install -U \1/p' | sh && alert 'Pip3 update complete!'

