" ======== General Config ========

syntax enable
set autoindent
set cursorline
set expandtab
set foldenable
set foldlevelstart=10
set foldmethod=indent
set foldnestmax=10
set hlsearch            " enable highlighting while searching
set ignorecase          " ignore case when searching
set incsearch           " find next match while typing search
set lazyredraw
set linebreak
set number relativenumber
set rnu
set rulerformat=%l,%v
set scrolloff=15
set shiftwidth=2
set showcmd
set showmatch
set sidescrolloff=15
set sidescroll=1
set smartcase           " enable case when searching if capital is typed
set smarttab
set smartindent
set splitbelow
set splitright
set softtabstop=2
set tabstop=2
set termguicolors
set timeoutlen=1000

let mapleader="\<Space>"

" set host_prog path to python executable
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" ======== Plugin Config ========

call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rsi'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'mattn/emmet-vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-github'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-cssomni'
Plug 'ncm2/ncm2-tern', {'do': 'npm install'}
Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'
Plug 'glacambre/firenvim', {'do': { _ -> firenvim#install(0) } }
Plug 'morhetz/gruvbox'
call plug#end()

" set syntax highlighting for config files
autocmd BufNewFile,BufRead .aliases set filetype=sh
" autocmd BufNewFile,BufRead *.conf set filetype=sh
autocmd BufNewFile,BufRead config set filetype=sh
autocmd BufNewFile,BufRead *.code-workspace set filetype=json

" ======== Color Config ========

" gruvbox configuration
set termguicolors
set background=light
let g:gruvbox_contrast_light = 'hard'
colorscheme gruvbox

" ======== ncm2 Config ========

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more info
set completeopt=noinsert,menuone,noselect

" Use <TAB> to select the ncm2 popup menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" ======== firenvim Config ========

" set firenvim to only load with <c-e>
" first we'll build the default settings object
let g:firenvim_config = {
  \ 'globalSettings': {
    \ 'alt': 'all',
  \ },
  \ 'localSettings': {
    \ '.*': {
      \ 'cmdline': 'firenvim',
      \ 'priority': 0,
      \ 'selector': 'textarea',
      \ 'takeover': 'never',
    \ },
  \ }
\ }

" set localSettings to shorthand
let fc = g:firenvim_config['localSettings']

" enable automatic syntax for various sites
if exists('g:started_by_firenvim')
  nnoremap <Esc><Esc> :call firenvim#focus_page()<CR>
  " nnoremap <Esc><> :call firenvim#press_keys("<>")
  " autocmd BufEnter freecodecamp.org_* inoremap <CR> <Esc>:w<CR>:call firenvim#press_keys("<LT><CR>")<CR>ggdGa
  augroup fcc_syntax
    au!
    autocmd BufNewFile,BufRead www.freecodecamp.**.txt set filetype=html
    autocmd BufNewFile,BufRead leetcode.**.txt set filetype=js
    autocmd BufNewFile,BufRead codewars.**.txt set filetype=js
    autocmd BufNewFile,BufRead github.com_*.txt set filetype=markdown
  augroup END
endif

" ======== Prettier Config ========
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 0
let g:prettier#quickfix_enabled = 0
let g:prettier#config#single_quote = 'true'
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#trailing_comma = 'es5'
autocmd BufWritePre *.js,*.jsx,*.css,*.scss,*.json,*.md,*.yaml,*.html PrettierAsync

" ======== Key Mapping Config ========

map <F6> :setlocal spell! spelllang=en_us<CR>
map <F5> :so $MYVIMRC<CR>
nnoremap S :%s///g<Left><Left><Left>
" inoremap <Leader><Tab> <C-y>,

" Auto indent pasted text
" This creates odd jumping around, needs tweaking
" nnoremap p p=`]<C-o>
" nnoremap P P=`]<C-o>

" Add semicolon, colon, comma to EOL
nnoremap <Leader>; m'A;<ESC>`'
nnoremap <Leader>, m'A,<ESC>`'
nnoremap <Leader>: m'A:<ESC>`'

" Switch line downwards/upwards
nnoremap <Leader>j ddp
nnoremap <Leader>k ddkP

" turn off search highlight
nnoremap <Leader>h :nohlsearch<CR>

" open/close folds
nnoremap <Leader>/ za

" highlight last inserted text
nnoremap gV `[v`]

" open NERDTree
map <Leader>n :NERDTreeToggle<CR>

" set tabs for specific filetypes
" autocmd Filetype css setlocal tabstop=4
" autocmd Filetype scss setlocal tabstop=4

inoremap <C-w><Space> <Esc>/<++><Enter>"_c4l
inoremap jj <Esc>
nnoremap <Leader>W :w<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
" nnoremap <C-w>h <C-w>s

autocmd FileType html inoremap ;i <em></em><Space><++><Esc>FeT>i
autocmd FileType html inoremap ;b <b></b><Space><++><Esc>FbT>i

