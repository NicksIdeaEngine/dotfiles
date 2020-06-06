" keys.vim file
" created by Nick Garcia
" https://github.com/NicksIdeaEngine/dotfiles

" general {{{

" toggle spellcheck
map! <F6> :setlocal spell! spelllang=en_us<cr>

" Allow quick additions to the spelling dict
" nnoremap <leader>g :spellgood <c-r><c-w>

" open file explorer (still exploring all 3)
nnoremap <leader>m :Hex<cr>
nnoremap <leader>M :Lex<cr>
" nnoremap <leader>m :Sex<cr>

" edit/reload init.vim file
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

" change directory to folder of current file
nnoremap <leader>cd :cd %:p:h<cr>

" space space saves lives
nnoremap <leader>z :w<cr>
nnoremap ZZ :wq<cr>

" select all
noremap <leader>a ggVG

" map Y like D and C
map Y y$

" switch line downwards/upwards
nnoremap <leader>j ddp
nnoremap <leader>k ddkP
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" add semicolon, colon, comma to eol
nnoremap <leader>; m'A;<esc>`'
nnoremap <leader>, m'A,<esc>`'
nnoremap <leader>: m'A:<esc>`'

" highlight last inserted text
nnoremap gV `[v`]

" keep visual selection when indenting/outdenting
vmap < <gv
vmap > >gv

" quick escape
inoremap jk <esc>

" force the habit
inoremap <esc> <nop>

" tab while in insert mode
inoremap \<Tab> <esc>V><esc>la
inoremap \<S-Tab> <esc>V<<esc>la

" }}}
" searching {{{

" turn off search highlight
nnoremap <leader>h :nohlsearch<cr>

" faster start to search/replace
nnoremap <leader>s :%s///g<left><left><left>

" smarter vim searching that turns off vim's default regex characters
nnoremap / /\v
vnoremap / /\v

" }}}
" folding {{{

" open/close folds
nnoremap <leader>/ za

" mappings to easily toggle fold levels
nnoremap z0 :set foldlevel=0<cr>
nnoremap z1 :set foldlevel=1<cr>
nnoremap z2 :set foldlevel=2<cr>
nnoremap z3 :set foldlevel=3<cr>
nnoremap z4 :set foldlevel=4<cr>
nnoremap z5 :set foldlevel=5<cr>

" }}}
" windows, layout, & workspace {{{

" better window navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" better window splitting
nnoremap <leader>S :vsp<cr>
nnoremap <leader>V :sp<cr>

" rotate upwards/leftwards
nnoremap <leader>< <c-w>R

" rotate downwards/rightwards
nnoremap <leader>> <c-w><c-r>

" exchange current window with next
nnoremap <leader>x <c-w>x

" better resizing
nnoremap <m-j> :res -1<cr>
nnoremap <m-k> :res +1<cr>
nnoremap <m-l> :vertical res +1<cr>
nnoremap <m-h> :vertical res -1<cr>

" auto resize all windows
map <leader>= <c-w>=

" }}}
" plugin specific {{{

command! PIU PlugInstall | PlugUpdate | PlugUpgrade

" coc hotkeys
" nmap <leader>gd <Plug>(coc-definition)
" nmap <leader>gr <Plug>(coc-references)

" fzf hotkeys
nnoremap <c-p> :GFiles<cr>

" }}}
" webdev mappings {{{

" sort CSS properties
nnoremap <leader><leader>s ?{<cr>jV/^\s*\}?$<cr>k:sort<cr>:noh<cr>

" launch dev servers
nnoremap <leader><leader>a :AsyncRun npm run devserver<cr>
nnoremap <leader><leader>q :AsyncStop<cr>
nnoremap <leader><leader>a :AsyncRun gatsby develop<cr>
nnoremap <leader><leader>q :AsyncStop<cr>

" potential base for quick HTML expansion while in insert mode
" inoremap <c-w><Space> <esc>/<++><enter>"_c4l
" autocmd FileType html inoremap ;i <em></em><Space><++><esc>FeT>i
" autocmd FileType html inoremap ;b <b></b><Space><++><esc>FbT>i

" }}}
" buffers {{{

" nnoremap <leader>Q :q<CR>    " Quickly close the current window
" nnoremap <leader>q :bd<CR>   " Quickly close the current buffer

" switch to prev/next buffer
noremap <leader>q :bp<cr>
noremap <leader>w :bn<cr>

" close all buffers but this one
noremap <leader>B :%bd\|e#<cr>

" show list of buffers
" noremap <leader>w :ls<cr>

" }}}
" final touch {{{
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
" }}}
