" keys.vim file
" created by Nick Garcia
" https://github.com/NicksIdeaEngine/dotfiles

" general {{{

" toggle spellcheck
map! <F6> :setlocal spell! spelllang=en_us<cr>

" spellcheck shortcuts using <leader>
" map <leader>sn ]s
" map <leader>sp [s
" map <leader>sa zg
" map <leader>s? z=

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

" Speed up scrolling of the viewport slightly
nnoremap <c-e> 4<c-e>
nnoremap <c-y> 4<c-y>

" quick escape
inoremap jk <esc>

" force the habit
inoremap <esc> <nop>

" tab while in insert mode
inoremap \<tab> <esc>V><esc>la
inoremap \<s-tab> <esc>V<<esc>la

" surround visual selection in symbol
" vnoremap $1 <esc>`>a)<esc>`<i(<esc>
" vnoremap $2 <esc>`>a]<esc>`<i[<esc>
" vnoremap $3 <esc>`>a}<esc>`<i{<esc>
" vnoremap $$ <esc>`>a"<esc>`<i"<esc>
" vnoremap $q <esc>`>a'<esc>`<i'<esc>
" vnoremap $e <esc>`>a`<esc>`<i`<esc>

" Map auto complete of (, ", ', [
" inoremap $1 ()<esc>i
" inoremap $2 []<esc>i
" inoremap $3 {}<esc>i
" inoremap $4 {<esc>o}<esc>O
" inoremap $q ''<esc>i
" inoremap $e ""<esc>i

" }}}
" searching {{{

" turn off search highlight
nnoremap <leader>h :nohlsearch<cr>

" faster start to search/replace
nnoremap <leader>s :%s///g<left><left><left>

" smarter vim searching that turns off vim's default regex characters
nnoremap / /\v
vnoremap / /\v

" search for current selection
" vnoremap <silent> * :call VisualSelection('f')<cr>
" vnoremap <silent> # :call VisualSelection('b')<cr>

" search and replace selected text
" vnoremap <silent> <leader>r :call VisualSelection('replace')<cr>

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
" tabs, windows, & layout {{{

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
nnoremap <leader>= <c-w>=

" better tab management
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tm :tabmove
nnoremap <leader>tl :tabnext
nnoremap <leader>th :tabprev

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nnoremap <leader>tj :exe "tabn ".g:lasttab<cr>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Toggle line numbers
nnoremap <leader><leader>n :setlocal number! relativenumber!<cr>

" }}}
" plugin specific {{{

command! PIU PlugInstall | PlugUpdate | PlugUpgrade

" coc hotkeys
" nmap <leader>gd <Plug>(coc-definition)
" nmap <leader>gr <Plug>(coc-references)

" fzf hotkeys
nnoremap <c-p> :GFiles<cr>

nnoremap <leader>r :Autoformat<cr>

" }}}
" webdev mappings {{{

" sort CSS properties
nnoremap <leader><leader>s ?{<cr>jV/^\s*\}?$<cr>k:sort<cr>:noh<cr>

" launch dev servers
" nnoremap <leader><leader>a :AsyncRun npm run devserver<cr>
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

" Specify the behavior when switching between buffers
" not sure if this is needed
" try
"   set switchbuf=useopen,usetab,newtab
"   set stal=2
" catch
" endtry

" }}}
" final touch {{{
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
" }}}
