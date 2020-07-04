" keys.vim file
" created by Nick Garcia
" https://github.com/NicksIdeaEngine/dotfiles

" general {{{

command! PIU PlugInstall | PlugUpdate | PlugUpgrade | UpdateRemotePlugins

" toggle spellcheck
nnoremap <F6> :setlocal spell! spelllang=en_us<cr>

" spellcheck shortcuts using <leader>
nnoremap <leader>sn ]s
nnoremap <leader>sp [s
nnoremap <leader>sa zg
nnoremap <leader>ss z=

" swap implementations of ` and ' jump to markers
nnoremap ' `
nnoremap ` '

" open file explorer
nnoremap <leader>fs         :Ranger<cr>
nnoremap <leader>FS         :RangerNewTab<cr>x <c-w>x
nnoremap <localleader>xl    :Lex<cr>
nnoremap <localleader>xh    :Hex<cr>
nnoremap <localleader>xs    :Sex<cr>

" reload init.vim file
nnoremap <silent> <leader>sv :so $MYVIMRC<cr>

" change directory to folder of current file
nnoremap <leader>cd :cd %:p:h<cr>

" space space saves lives
nnoremap <leader>z :w<cr>
nnoremap <leader>Z :wq<cr>
nnoremap <leader><leader>Z :qa<cr>

" select all
noremap <leader><leader>a ggVG

" map Y like D and C
nnoremap Y y$

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
vnoremap < <gv
vnoremap > >gv

" Speed up scrolling of the viewport slightly
nnoremap <c-e> 4<c-e>
nnoremap <c-y> 4<c-y>

" surround visual selection in symbol
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a`<esc>`<i`<esc>

" Sort paragraphs
" vnoremap <leader>s !sort -f<CR>gv
" nnoremap <leader>s vip!sort -f<CR><Esc>

" make p in Visual mode replace the selected text with the yank register
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" formatting for rust
nnoremap <leader>af :Autoformat<cr>

" }}}
" searching {{{

" turn off search highlight
nnoremap <leader>hi :nohlsearch<cr>

" faster start to search/replace
nnoremap <leader>sr :%s///g<left><left><left>

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
nnoremap <leader>tm :tabmove<cr>
nnoremap <leader>tl :tabnext<cr>
nnoremap <leader>th :tabprev<cr>

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
" webdev mappings {{{

" sort CSS properties
nnoremap <leader><leader>s ?{<cr>jV/^\s*\}?$<cr>k:sort<cr>:noh<cr>

" emmet expansion
" inoremap <localleader>e

" launch dev servers
nnoremap <leader><leader>ns :AsyncRun npm start<cr>
nnoremap <leader><leader>nrd :AsyncRun npm run devserver<cr>
nnoremap <leader><leader>gd :AsyncRun gatsby develop<cr>
nnoremap <leader><leader>q :AsyncStop<cr>

" potential base for quick HTML expansion while in insert mode
" inoremap <c-w><Space> <esc>/<++><enter>"_c4l
" autocmd FileType html inoremap ;i <em></em><Space><++><esc>FeT>i
" autocmd FileType html inoremap ;b <b></b><Space><++><esc>FbT>i

" }}}
" buffers {{{

" nnoremap <leader>Q :q<cr>
" nnoremap <leader>q :bd<cr>

" switch to prev/next buffer
nnoremap <leader>q :bp<cr>
nnoremap <leader>w :bn<cr>

" close all buffers but this one
nnoremap <leader>bc :%bd\|e#<cr>

" show list of buffers
nnoremap <leader>bl :ls<cr>

" Specify the behavior when switching between buffers
" not sure if this is needed
" try
"   set switchbuf=useopen,usetab,newtab
"   set stal=2
" catch
" endtry

" }}}
" insert mode helpers {{{

" indent left/right while in insert mode
inoremap <localleader><tab> <esc>V><esc>la
inoremap <localleader><s-tab> <esc>V<<esc>la

" use tab/s-tab/cr to enter/navigate/select from autocompletion
inoremap <expr> <tab>   pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
inoremap <expr> <cr>    pumvisible() ? "\<c-y>" : "\<cr>"
inoremap <tab> <c-n>

" move easily while in insert mode
inoremap <m-h> <left>
inoremap <m-j> <down>
inoremap <m-k> <up>
inoremap <m-l> <right>
inoremap <m-H> <esc>I
inoremap <m-J> <down><down><down><down><down>
inoremap <m-K> <up><up><up><up><up>
inoremap <m-L> <esc>A

" quick escape
inoremap jk <esc>

" force the habit
imap <esc> <nop>

" }}}
" final touch {{{
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
" }}}
