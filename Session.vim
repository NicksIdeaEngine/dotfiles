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
badd +1 /mnt/sdc1/dbx/dots/.bashrc
badd +1 /mnt/sdc1/dbx/dots/.zshrc
badd +1 /mnt/sdc1/dbx/dots/.zshenv
badd +1 /mnt/sdc1/dbx/dots/.zprofile
badd +1 /mnt/sdc1/dbx/dots/.Xmodmap
badd +1 /mnt/sdc1/dbx/dots/.vimrc
badd +1 /mnt/sdc1/dbx/dots/.config/i3/config
badd +1 /mnt/sdc1/dbx/dots/vmap_keys.txt
badd +1 /mnt/sdc1/dbx/dots/nmap_keys.txt
badd +1 /mnt/sdc1/dbx/dots/imap_keys.txt
badd +1 /mnt/sdc1/dbx/dots/vim_keys.txt
badd +0 /mnt/sdc1/dbx/dots/.gitignore
argglobal
%argdel
$argadd /mnt/sdc1/dbx/proj/dots/
set stal=2
edit /mnt/sdc1/dbx/dots/.vimrc
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
setlocal fdl=10
setlocal fml=1
setlocal fdn=10
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 34) / 68)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
if bufexists("/mnt/sdc1/dbx/dots/.aliases") | buffer /mnt/sdc1/dbx/dots/.aliases | else | edit /mnt/sdc1/dbx/dots/.aliases | endif
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=10
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 34) / 68)
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
let s:l = 1 - ((0 * winheight(0) + 34) / 68)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 85 + 128) / 256)
exe 'vert 2resize ' . ((&columns * 85 + 128) / 256)
exe 'vert 3resize ' . ((&columns * 84 + 128) / 256)
tabedit /mnt/sdc1/dbx/dots/.gitignore
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=10
setlocal fen
let s:l = 12 - ((11 * winheight(0) + 34) / 68)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
12
normal! 03|
tabedit /mnt/sdc1/dbx/dots/vim_keys.txt
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 35 + 35) / 71)
exe 'vert 1resize ' . ((&columns * 128 + 128) / 256)
exe '2resize ' . ((&lines * 32 + 35) / 71)
exe 'vert 2resize ' . ((&columns * 128 + 128) / 256)
exe '3resize ' . ((&lines * 35 + 35) / 71)
exe 'vert 3resize ' . ((&columns * 127 + 128) / 256)
exe '4resize ' . ((&lines * 32 + 35) / 71)
exe 'vert 4resize ' . ((&columns * 127 + 128) / 256)
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=10
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 17) / 35)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
if bufexists("/mnt/sdc1/dbx/dots/nmap_keys.txt") | buffer /mnt/sdc1/dbx/dots/nmap_keys.txt | else | edit /mnt/sdc1/dbx/dots/nmap_keys.txt | endif
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=10
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 16) / 32)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
if bufexists("/mnt/sdc1/dbx/dots/imap_keys.txt") | buffer /mnt/sdc1/dbx/dots/imap_keys.txt | else | edit /mnt/sdc1/dbx/dots/imap_keys.txt | endif
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=10
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 17) / 35)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
if bufexists("/mnt/sdc1/dbx/dots/vmap_keys.txt") | buffer /mnt/sdc1/dbx/dots/vmap_keys.txt | else | edit /mnt/sdc1/dbx/dots/vmap_keys.txt | endif
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=10
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 16) / 32)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
exe '1resize ' . ((&lines * 35 + 35) / 71)
exe 'vert 1resize ' . ((&columns * 128 + 128) / 256)
exe '2resize ' . ((&lines * 32 + 35) / 71)
exe 'vert 2resize ' . ((&columns * 128 + 128) / 256)
exe '3resize ' . ((&lines * 35 + 35) / 71)
exe 'vert 3resize ' . ((&columns * 127 + 128) / 256)
exe '4resize ' . ((&lines * 32 + 35) / 71)
exe 'vert 4resize ' . ((&columns * 127 + 128) / 256)
tabnext 2
set stal=1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOFc
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
