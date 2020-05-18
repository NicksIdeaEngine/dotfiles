let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd /mnt/sdc1/dbx/dots/refs/linux/vim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +11 /mnt/sdc1/dbx/dots/refs/index.md
badd +7 /mnt/sdc1/dbx/dots/refs/journals/index.md
badd +39 /mnt/sdc1/dbx/dots/refs/journals/desktop-timeline.md
badd +10 /mnt/sdc1/dbx/dots/refs/linux/index.md
badd +5 /mnt/sdc1/dbx/dots/refs/linux/vim/index.md
badd +49 /mnt/sdc1/dbx/dots/refs/linux/vim/vimref.md
badd +1 /mnt/sdc1/dbx/dots/refs/linux/vim/temp-notes.md
badd +9 /mnt/sdc1/dbx/dots/refs/linux/cmd/index.md
badd +16 /mnt/sdc1/dbx/dots/refs/linux/cmd/oneliners.md
badd +1 /mnt/sdc1/dbx/dots/refs/markdown.md
argglobal
%argdel
$argadd /mnt/sdc1/dbx/dots/refs/index.md
set stal=2
edit /mnt/sdc1/dbx/dots/refs/linux/cmd/oneliners.md
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=10
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 33) / 66)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit /mnt/sdc1/dbx/dots/refs/linux/vim/vimref.md
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=10
setlocal fen
silent! normal! zE
let s:l = 33 - ((24 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
33
normal! 035|
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
