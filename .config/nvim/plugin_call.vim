" plugin_call.vim
" created by Nick Garcia
" https://github.com/NicksIdeaEngine/dotfiles

call plug#begin()

" syntax & formatting {{{

" https://github.com/editorconfig/editorconfig-vim
Plug 'editorconfig/editorconfig-vim'

" https://github.com/alvan/vim-closetag
Plug 'alvan/vim-closetag'

" https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'

" https://github.com/chiel92/vim-autoformat
Plug 'chiel92/vim-autoformat'

" https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'

" https://github.com/prettier/vim-prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" https://github.com/styled-components/vim-styled-components
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" https://github.com/nvie/vim-flake8
Plug 'nvie/vim-flake8'

" https://github.com/psf/black
Plug 'psf/black', { 'branch': 'stable' }

" https://github.com/rust-lang/rust.vim
Plug 'rust-lang/rust.vim'

" https://github.com/racer-rust/vim-racer
Plug 'racer-rust/vim-racer'

" }}}
" completion, linting, & intellisense {{{

" https://github.com/mattn/emmet-vim
Plug 'mattn/emmet-vim'

" https://github.com/dense-analysis/ale
Plug 'dense-analysis/ale'

" https://github.com/SirVer/ultisnips
Plug 'SirVer/ultisnips'

" https://github.com/mlaursen/vim-react-snippets
Plug 'mlaursen/vim-react-snippets'

" https://github.com/Shougo/deoplete.nvim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" https://github.com/ternjs/tern_for_vim
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }

" https://github.com/carlitux/deoplete-ternjs
Plug 'carlitux/deoplete-ternjs'

" }}}
" searching code & files {{{

" https://github.com/airblade/vim-rooter
Plug 'airblade/vim-rooter'

" https://github.com/junegunn/fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" https://github.com/ludovicchabant/vim-gutentags
Plug 'ludovicchabant/vim-gutentags'

" https://github.com/justinmk/vim-sneak
Plug 'justinmk/vim-sneak'

" https://github.com/mileszs/ack.vim
Plug 'mileszs/ack.vim'

" https://github.com/rbgrouleff/bclose.vim
Plug 'rbgrouleff/bclose.vim'

" https://github.com/francoiscabrol/ranger.vim
Plug 'francoiscabrol/ranger.vim'

" }}}
" productivity {{{

" https://github.com/vimwiki/vimwiki
Plug 'vimwiki/vimwiki'

" https://github.com/freitass/todo.txt-vim
Plug 'freitass/todo.txt-vim'

" https://github.com/wakatime/vim-wakatime
" Plug 'wakatime/vim-wakatime'

" }}}
" utils {{{

" https://github.com/liuchengxu/vim-which-key
Plug 'liuchengxu/vim-which-key'

" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'

" https://github.com/tpope/vim-repeat
Plug 'tpope/vim-repeat'

" https://github.com/iamcco/markdown-preview.nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

" https://github.com/wellle/targets.vim
Plug 'wellle/targets.vim'

" https://github.com/dbmrq/vim-ditto
Plug 'dbmrq/vim-ditto'

" https://github.com/tpope/vim-obsession
Plug 'tpope/vim-obsession'

" https://github.com/skywind3000/asyncrun.vim
Plug 'skywind3000/asyncrun.vim'

" https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'

" https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'

" }}}
" aesthetics {{{

" https://github.com/gruvbox-community/gruvbox
Plug 'gruvbox-community/gruvbox'

" https://github.com/junegunn/goyo.vim
Plug 'junegunn/goyo.vim'

" https://github.com/junegunn/limelight.vim
Plug 'junegunn/limelight.vim'

" https://github.com/sainnhe/artify.vim
Plug 'sainnhe/artify.vim'

" https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'

" https://github.com/itchyny/vim-gitbranch
Plug 'itchyny/vim-gitbranch'

" https://github.com/maximbaz/lightline-ale
Plug 'maximbaz/lightline-ale'

" https://github.com/albertomontesg/lightline-asyncrun
Plug 'albertomontesg/lightline-asyncrun'

" https://github.com/sainnhe/tmuxline.vim
Plug 'sainnhe/tmuxline.vim'

" https://github.com/ryanoasis/vim-devicons
Plug 'ryanoasis/vim-devicons'

" }}}

call plug#end()
