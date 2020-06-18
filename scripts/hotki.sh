#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

# grep "^\$\(\(m\|sm\|cm\|scm\)od\|br\)" ~/.config/i3/config | rofi -i -dmenu
grep "^\(nnoremap\|vnoremap\|inoremap\|tnoremap\|noremap\)" \
  ~/.config/nvim/*.vim | \
  sed "s/\/home\/efex\/.config\/nvim\///g" | \
  sed "s/.vim\:/ /g" | \
  sed "s/tnoremap/term/g" | \
  sed "s/nnoremap/norm/g" | \
  sed "s/vnoremap/visu/g" | \
  sed "s/inoremap/insr/g" | \
  sed "s/noremap/nvso/g" | \
  sed "s/functions/func/g" | \
  sed "s/plugin_config/plug/g" | \
  sed "s/ <silent>//g" | \
  sed "s/\:call nvim_open_win.*/open terminal/g" | \
  sed "s/<c-\\\><c-n>\:call TerminalToggle.*/close terminal/g" | \
  sed "s/pumvisible.*/completion window navigation/g" | \
  sed "s/\:setlocal num.*/toggle line nums/g" | \
  sed "s/?{<cr>jV.*/sort css properties/g" | \
  rofi -dmenu -i -theme hotkeys
