let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd /mnt/sdc1/dbx/dots
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 /mnt/sdc1/dbx/dots/.aliases
badd +4 /mnt/sdc1/dbx/dots/.config/i3/config
badd +388 /mnt/sdc1/dbx/dots/.vimrc
badd +10 /mnt/sdc1/dbx/dots/.gitignore
badd +1 /mnt/sdc1/dbx/dots/scripts/date-alert.sh
badd +8 /mnt/sdc1/dbx/dots/scripts/alertr.sh
badd +13 /mnt/sdc1/dbx/dots/scripts/cpustatus.sh
badd +13 /mnt/sdc1/dbx/dots/scripts/gpustatus.sh
badd +26 /mnt/sdc1/dbx/dots/scripts/fanstatus.sh
badd +1 /mnt/sdc1/dbx/dots/scripts/redshiftstatus.sh
badd +12 /mnt/sdc1/dbx/dots/scripts/rescuetimestatus.sh
badd +32 /mnt/sdc1/dbx/dots/.config/polybar/config.ini
badd +1 /mnt/sdc1/dbx/dots/.config/polybar/user_modules.ini
badd +1 /mnt/sdc1/dbx/dots/.config/rofi/centermenu.rasi
badd +28 /mnt/sdc1/dbx/dots/.config/rofi/dropmenu.rasi
badd +1 /mnt/sdc1/dbx/dots/.config/rofi/oneliner.rasi
badd +49 /mnt/sdc1/dbx/dots/.config/rofi/sysmenu.rasi
badd +12 /mnt/sdc1/dbx/dots/scripts/launcher.sh
badd +6 /mnt/sdc1/dbx/dots/scripts/rofidropmenu.sh
badd +6 /mnt/sdc1/dbx/dots/scripts/rofioneliner.sh
badd +10 /mnt/sdc1/dbx/dots/scripts/sysmenu.sh
badd +8 /mnt/sdc1/dbx/dots/scripts/autoscriptmenu.sh
badd +322 term://.//646311:zsh
badd +1 /mnt/sdc1/dbx/dots/.config/rofi/globals.rasi
badd +1 /mnt/sdc1/dbx/dots/.Xresources
badd +1 /mnt/sdc1/dbx/dots/.config/rofi/config.rasi
badd +33 /mnt/sdc1/dbx/dots/.config/rofi/gruvbox-light.rasi
badd +2 /mnt/sdc1/dbx/dots/.config/rofi/gruvbox-dark.rasi
badd +1 term://.//1223716:zsh
badd +50 /mnt/sdc1/dbx/dots/.config/rofi/appmenu.rasi
badd +1 /mnt/sdc1/dbx/dots/.config/i3/layouts/2-panel-workflow.json
badd +1 /mnt/sdc1/dbx/todo/archive.txt
badd +54 /mnt/sdc1/dbx/dots/.config/rofi/cmdmenu.rasi
badd +7 /mnt/sdc1/dbx/dots/.config/rofi/firacode.rasi
badd +1 /mnt/sdc1/dbx/dots/.config/rofi/config-example.rasi
badd +6 /mnt/sdc1/dbx/dots/scripts/cmdmenu.sh
badd +25 /mnt/sdc1/dbx/dots/scripts/projmenu.sh
badd +11 /mnt/sdc1/dbx/dots/scripts/autoscript.sh
badd +53 /mnt/sdc1/dbx/dots/.config/rofi/projmenu.rasi
badd +3 /mnt/sdc1/dbx/dots/.config/rofi/scriptr.rasi
badd +11 /mnt/sdc1/dbx/dots/scripts/scriptr.sh
badd +5 /mnt/sdc1/dbx/dots/.config/rofi/appfetch.rasi
badd +22 /mnt/sdc1/dbx/dots/scripts/projify.sh
badd +1 term://.//1005197:zsh
badd +2 term://.//155890:/bin/zsh
badd +11 /mnt/sdc1/dbx/dots/scripts/colorswitch.sh
badd +1 /mnt/sdc1/dbx/dots/.config/kitty/kitty-colors.conf
badd +37 /mnt/sdc1/dbx/dots/.config/kitty/kitty.conf
badd +1 /mnt/sdc1/dbx/dots/.config/kitty/kitty-light.conf
badd +1 /mnt/sdc1/dbx/dots/.config/kitty/kitty-dark.conf
badd +1 term://.//582203:/bin/zsh
badd +153 /mnt/sdc1/dbx/dots/scripts/sysbackup.sh
argglobal
%argdel
$argadd .aliases
edit /mnt/sdc1/dbx/dots/.aliases
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 85 + 128) / 256)
exe 'vert 2resize ' . ((&columns * 85 + 128) / 256)
exe 'vert 3resize ' . ((&columns * 84 + 128) / 256)
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=10
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 34) / 69)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
if bufexists("/mnt/sdc1/dbx/dots/.config/i3/config") | buffer /mnt/sdc1/dbx/dots/.config/i3/config | else | edit /mnt/sdc1/dbx/dots/.config/i3/config | endif
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=10
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 34) / 69)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
if bufexists("/mnt/sdc1/dbx/dots/.vimrc") | buffer /mnt/sdc1/dbx/dots/.vimrc | else | edit /mnt/sdc1/dbx/dots/.vimrc | endif
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=10
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 34) / 69)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 85 + 128) / 256)
exe 'vert 2resize ' . ((&columns * 85 + 128) / 256)
exe 'vert 3resize ' . ((&columns * 84 + 128) / 256)
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=1 winminheight=1 winminwidth=1 shortmess=filnxtToOFc
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
