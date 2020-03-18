" " Plugins
" call plug#begin()
" " Load gruvbox
" " Plug 'morhetz/gruvbox'

" " Load vim-surround
" Plug 'tpope/vim-surround'

" " Load vim-sensible
" Plug 'tpope/vim-sensible'

" " Load vim-commentary
" Plug 'tpope/vim-commentary'

" " On-demand loading
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" " post install (yarn install | npm install)
" Plug 'prettier/vim-prettier', { 'do': 'npm install' }
" call plug#end()

" Load colorscheme - currently doesn't work?
" colorscheme gruvbox
" set termguicolors

" override vim-sensible with options below here
" runtime! plugin/sensible.vim

" Basic Settings
" syntax enable
" set rnu
" set tabstop=2
" set softtabstop=2
" set expandtab
" set shiftwidth=2
" set rulerformat=%l,%v
" set showcmd
" set cursorline
" set lazyredraw
" set showmatch
" set incsearch
" set hlsearch
" set foldenable
" set foldmethod=indent
" set foldlevelstart=10
" set foldnestmax=10
" set timeoutlen=2000

" <Leader> mapping
" let mapleader="\<Space>"

" Add semicolon to EOL
" nnoremap <Leader>; m'A;<ESC>`'

" Switch line downwards
" nnoremap <Leader>j m'ddp

" Switch line upwards
" nnoremap <Leader>k m'ddkP

" turn off search highlight
" nnoremap <Leader>, :nohlsearch<CR>

" open/close folds
" nnoremap <Leader>/ za

" highlight last inserted text
" nnoremap gV `[v`]

" Open NERDTree
" map <Leader>n :NERDTreeToggle<CR>

" Set tabs for specific filetypes
" autocmd Filetype css setlocal tabstop=4
" autocmd Filetype scss setlocal tabstop=4
