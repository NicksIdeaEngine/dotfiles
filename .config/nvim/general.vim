" general.vim file
" created by Nick Garcia
" https://github.com/NicksIdeaEngine/dotfiles

" important globals {{{

let mapleader="\<space>"
let maplocalleader="\\"
nnoremap <space> <nop>
filetype plugin indent on
syntax on

" }}}
" global variables {{{

" set host_prog path to python executable
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" this setting must be set before ale is loaded
let g:ale_completion_enabled = 1

" }}}
" settings {{{

" utils {{{
set clipboard=unnamedplus   " cut/yank/paste use system register
set updatetime=100          " slow update time causes lag
set showcmd                 " show partial command in last line of screen
set history=1000            " remember more commands and search history
set undolevels=1000         " use many levels of undo
" }}}
" tabbing & indenting {{{
set expandtab               " use spaces instead of tabs
set autoindent              " autoindent based expandtab
set smartindent             " smarter indent for C-like languages
set smarttab                " smarter tab for C-like languages
set shiftwidth=2            " when reading, tabs are 2 spaces
set softtabstop=2           " in insert mode, tabs are 2 spaces
set tabstop=2               " tab is two spaces
" }}}
" formatting {{{
set nrformats=              " treat .1 as decimal, like 0.1
set wrap                    " enable text wrapping
set linebreak               " wrap long lines at a character in 'breakat'
set textwidth=80            " set text to wrap past column 80
set colorcolumn=+1          " add colored column at column 81
set formatoptions=tcqon1    " set text formatting options
set magic                   " turn magic on for regular expressions
" }}}
" searching {{{
set hlsearch                " enable highlighting while searching
set ignorecase              " ignore case when searching
set smartcase               " enable case when searching if capital is typed
set incsearch               " find next match while typing search
" }}}
" aesthetics & UI {{{
set number relativenumber   " set relative numbers
set showmatch               " higlight matching brackets under cursor
set splitbelow              " open new splits below
set splitright              " open new splits right
set cursorline              " highlight line where cursor is
set noerrorbells            " no beeps
set visualbell              " only visual beeps
set conceallevel=2          " use custom replacement char, or hide conceal text

" don't redraw screen while running macros, registers, & non-typed comments
set lazyredraw
" }}}
" files & commands {{{
set autochdir               " auto change current dir to dir of current file
set nobackup                " stop vim from creating backup files
set noswapfile              " stop vim from creating swap files
set autoread                " reload files changed outside of vim
set hidden                  " buffers stay in background
set title
" }}}
" folding {{{
set foldenable              " enable folding
set foldlevelstart=0        " close all folds upon buffer enter
set foldmethod=marker       " use standard vimfold markers
set foldnestmax=10          " set max fold nesting
" }}}
" completion {{{
set timeoutlen=1000                   " time to wait for mapped sequence completion
set shortmess+=c                      " disable ins-completion-menu messages
set wildmenu                          " make tab completion act like bash
set wildmode=list:longest             " enable Wild menu
set omnifunc=syntaxcomplete#Complete  " enable omnifunc completion

" ignore npm/git/deploy dirs, pics, backups
set wildignore+=**/node_modules/**,**/dist/**,**/public/**,**/.git/**,*.swp,*.png,*.jpg,*.gif,*.webp,*.jpeg,*.map,*.bak
" }}}

" }}}
