" ======== Summary ======== {{{
"
" }}}
" ======== General Config ======== {{{

" set nocompatible
filetype plugin on
syntax on
set autoindent
set cursorline
set expandtab
set foldenable
set foldlevelstart=10
set foldmethod=marker
set foldnestmax=10
set hlsearch            " enable highlighting while searching
set ignorecase          " ignore case when searching
set incsearch           " find next match while typing search
set lazyredraw
set linebreak
set number relativenumber
set rnu
set rulerformat=%l,%v
set shiftwidth=2
set showcmd
set showmatch
set sidescroll=1
set smartcase           " enable case when searching if capital is typed
set smarttab
set smartindent
set splitbelow
set splitright
set softtabstop=2
set tabstop=2
set timeoutlen=1000

let mapleader="\<Space>"

" set host_prog path to python executable
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" }}}
" ======== Plugin Config ======== {{{

call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-obsession'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'mattn/emmet-vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'freitass/todo.txt-vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'wellle/targets.vim'
Plug 'morhetz/gruvbox'
Plug 'maxmellon/vim-jsx-pretty', { 'as': 'vim-syntax-jsx', 'for': [ 'javascriptreact' ] }
Plug 'tjdevries/coc-zsh'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'dbmrq/vim-ditto'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/artify.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'macthecadillac/lightline-gitdiff'
Plug 'maximbaz/lightline-ale'
Plug 'albertomontesg/lightline-asyncrun'
Plug 'rmolin88/pomodoro.vim'
Plug 'sainnhe/tmuxline.vim'
call plug#end()

" }}}
" ======== Misc Config ======== {{{
" set syntax highlighting for config files
autocmd BufNewFile,BufRead .aliases set filetype=sh
" autocmd BufNewFile,BufRead *.conf set filetype=sh
autocmd BufNewFile,BufRead config set filetype=sh
autocmd BufNewFile,BufRead *.code-workspace set filetype=json

" vim wiki
let g:vimwiki_list = [{'path': '~/refs/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_diary_months = {
  \ 1: 'January', 2: 'February', 3: 'March', 4: 'April', 5: 'May',
  \ 6: 'June', 7: 'July', 8: 'August', 9: 'September', 10: 'October',
  \ 11: 'November', 12: 'December' }

" vim-ditto settings https://github.com/dbmrq/vim-ditto
au FileType markdown,text,tex DittoOn " turn on ditto's autocmds
nmap <leader>di <Plug>ToggleDitto     " turn ditto on and off

" Vimscript file settings -------------------- {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
"{{{goyo.vim
"{{{goyo.vim-usage
" <leader>mr  toggle reading mode
"}}}
let g:goyo_width = 95
let g:goyo_height = 85
let g:goyo_linenr = 0
"进入goyo模式后自动触发limelight,退出后则关闭
augroup goyoCustom
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
augroup END
nnoremap <silent> <leader><leader>f :<C-u>Limelight!!<CR>
nnoremap <silent> <leader><leader>r :<C-u>Goyo<CR>
" let g:which_key_map["\<space>"]['f'] = 'focus mode'
" let g:which_key_map["\<space>"]['r'] = 'reading mode'
"}}}
" }}}
" ======== Color Config ======== {{{

" gruvbox configuration
set termguicolors
set background=light
let g:gruvbox_contrast_light = 'hard'
colorscheme gruvbox

" }}}
" ======== lightline Config ======== {{{
"{{{lightline.vim
"{{{lightline.vim-usage
" :h 'statusline'
" :h g:lightline.component
"}}}
"{{{functions
function! PomodoroStatus() abort"{{{
  if pomo#remaining_time() ==# '0'
    return "\ue001"
  else
    return "\ue003 ".pomo#remaining_time()
  endif
endfunction"}}}
function! CocCurrentFunction()"{{{
  return get(b:, 'coc_current_function', '')
endfunction"}}}
function! Devicons_Filetype()"{{{
  " return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : 'no ft') : ''
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction"}}}
function! Devicons_Fileformat()"{{{
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction"}}}
function! Artify_active_tab_num(n) abort"{{{
  return Artify(a:n, 'bold')." \ue0bb"
endfunction"}}}
function! Tab_num(n) abort"{{{
  return a:n." \ue0bb"
endfunction"}}}
function! Gitbranch() abort"{{{
  if gitbranch#name() !=# ''
    return gitbranch#name()." \ue725"
  else
    return "\ue61b"
  endif
endfunction"}}}
function! Artify_inactive_tab_num(n) abort"{{{
  return Artify(a:n, 'double_struck')." \ue0bb"
endfunction"}}}
function! Artify_lightline_tab_filename(s) abort"{{{
  return Artify(lightline#tab#filename(a:s), 'monospace')
endfunction"}}}
function! Artify_lightline_mode() abort"{{{
  return Artify(lightline#mode(), 'monospace')
endfunction"}}}
function! Artify_line_percent() abort"{{{
  return Artify(string((100*line('.'))/line('$')), 'bold')
endfunction"}}}
function! Artify_line_num() abort"{{{
  return Artify(string(line('.')), 'bold')
endfunction"}}}
function! Artify_col_num() abort"{{{
  return Artify(string(getcurpos()[2]), 'bold')
endfunction"}}}
function! Artify_gitbranch() abort"{{{
  if gitbranch#name() !=# ''
    return Artify(gitbranch#name(), 'monospace')." \ue725"
  else
    return "\ue61b"
  endif
endfunction"}}}
"}}}
set laststatus=2  " Basic
set noshowmode  " Disable show mode info
augroup lightlineCustom
  autocmd!
  autocmd BufWritePost * call lightline_gitdiff#query_git() | call lightline#update()
augroup END
let g:lightline = { 'colorscheme': "gruvbox" }
let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
let g:lightline.subseparator = { 'left': "\ue621", 'right': "\ue621" }
let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf529"
let g:lightline#ale#indicator_errors = "\uf00d"
let g:lightline#ale#indicator_ok = "\uf00c"
let g:lightline_gitdiff#indicator_added = '+'
let g:lightline_gitdiff#indicator_deleted = '-'
let g:lightline_gitdiff#indicator_modified = '*'
let g:lightline_gitdiff#min_winwidth = '70'
let g:lightline#asyncrun#indicator_none = ''
let g:lightline#asyncrun#indicator_run = 'Running...'
let g:lightlineArtify = 1
if g:lightlineArtify == 1
  let g:lightline.active = {
        \ 'left': [ [ 'artify_mode', 'paste' ],
        \           [ 'readonly', 'filename', 'modified', 'fileformat', 'devicons_filetype' ] ],
        \ 'right': [ [ 'artify_lineinfo' ],
        \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'pomodoro' ],
        \           [ 'asyncrun_status', 'coc_status' ] ]
        \ }
  let g:lightline.inactive = {
        \ 'left': [ [ 'filename' , 'modified', 'fileformat', 'devicons_filetype' ]],
        \ 'right': [ [ 'artify_lineinfo' ] ]
        \ }
  let g:lightline.tabline = {
        \ 'left': [ [ 'vim_logo', 'tabs' ] ],
        \ 'right': [ [ 'artify_gitbranch' ],
        \ [ 'gitstatus' ] ]
        \ }
  let g:lightline.tab = {
        \ 'active': [ 'artify_activetabnum', 'artify_filename', 'modified' ],
        \ 'inactive': [ 'artify_inactivetabnum', 'filename', 'modified' ] }
else
  let g:lightline.active = {
        \ 'left': [ [ 'mode', 'paste' ],
        \           [ 'readonly', 'filename', 'modified', 'fileformat', 'devicons_filetype' ] ],
        \ 'right': [ [ 'lineinfo' ],
        \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'pomodoro' ],
        \           [ 'asyncrun_status', 'coc_status' ] ]
        \ }
  let g:lightline.inactive = {
        \ 'left': [ [ 'filename' , 'modified', 'fileformat', 'devicons_filetype' ]],
        \ 'right': [ [ 'lineinfo' ] ]
        \ }
  let g:lightline.tabline = {
        \ 'left': [ [ 'vim_logo', 'tabs' ] ],
        \ 'right': [ [ 'gitbranch' ],
        \ [ 'gitstatus' ] ]
        \ }
  let g:lightline.tab = {
        \ 'active': [ 'tabnum', 'filename', 'modified' ],
        \ 'inactive': [ 'tabnum', 'filename', 'modified' ] }
endif
let g:lightline.tab_component = {}
let g:lightline.tab_component_function = {
      \ 'artify_activetabnum': 'Artify_active_tab_num',
      \ 'artify_inactivetabnum': 'Artify_inactive_tab_num',
      \ 'artify_filename': 'Artify_lightline_tab_filename',
      \ 'filename': 'lightline#tab#filename',
      \ 'modified': 'lightline#tab#modified',
      \ 'readonly': 'lightline#tab#readonly',
      \ 'tabnum': 'Tab_num'
      \ }
let g:lightline.component = {
      \ 'artify_gitbranch' : '%{Artify_gitbranch()}',
      \ 'artify_mode': '%{Artify_lightline_mode()}',
      \ 'artify_lineinfo': "%2{Artify_line_percent()}\uf295 %3{Artify_line_num()}:%-2{Artify_col_num()}",
      \ 'gitstatus' : '%{lightline_gitdiff#get_status()}',
      \ 'bufinfo': '%{bufname("%")}:%{bufnr("%")}',
      \ 'vim_logo': "\ue7c5",
      \ 'pomodoro': '%{PomodoroStatus()}',
      \ 'mode': '%{lightline#mode()}',
      \ 'absolutepath': '%F',
      \ 'relativepath': '%f',
      \ 'filename': '%t',
      \ 'filesize': "%{HumanSize(line2byte('$') + len(getline('$')))}",
      \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
      \ 'fileformat': '%{&fenc!=#""?&fenc:&enc}[%{&ff}]',
      \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
      \ 'modified': '%M',
      \ 'bufnum': '%n',
      \ 'paste': '%{&paste?"PASTE":""}',
      \ 'readonly': '%R',
      \ 'charvalue': '%b',
      \ 'charvaluehex': '%B',
      \ 'percent': '%2p%%',
      \ 'percentwin': '%P',
      \ 'spell': '%{&spell?&spelllang:""}',
      \ 'lineinfo': '%2p%% %3l:%-2v',
      \ 'line': '%l',
      \ 'column': '%c',
      \ 'close': '%999X X ',
      \ 'winnr': '%{winnr()}'
      \ }
let g:lightline.component_function = {
      \ 'gitbranch': 'Gitbranch',
      \ 'devicons_filetype': 'Devicons_Filetype',
      \ 'devicons_fileformat': 'Devicons_Fileformat',
      \ 'coc_status': 'coc#status',
      \ 'coc_currentfunction': 'CocCurrentFunction'
      \ }
let g:lightline.component_expand = {
      \ 'linter_checking': 'lightline#ale#checking',
      \ 'linter_warnings': 'lightline#ale#warnings',
      \ 'linter_errors': 'lightline#ale#errors',
      \ 'linter_ok': 'lightline#ale#ok',
      \ 'asyncrun_status': 'lightline#asyncrun#status'
      \ }
let g:lightline.component_type = {
      \ 'linter_warnings': 'warning',
      \ 'linter_errors': 'error'
      \ }
let g:lightline.component_visible_condition = {
      \ 'gitstatus': 'lightline_gitdiff#get_status() !=# ""'
      \ }
"}}}
" }}}
" ======== Prettier Config ======== {{{

let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 0
let g:prettier#quickfix_enabled = 0
let g:prettier#config#single_quote = 'true'
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#trailing_comma = 'es5'
autocmd BufWritePre *.js,*.jsx,*.css,*.scss,*.json,*.md,*.yaml,*.html PrettierAsync

" }}}

" set auto saving/restoring of vim folds
au BufWinLeave * mkview
au BufWinEnter * silent loadview

" ======== Key Mapping Config ======== {{{

command PIU PlugInstall | PlugUpdate | PlugUpgrade
map <F6> :setlocal spell! spelllang=en_us<CR>
" map! <F5> :so $MYVIMRC<CR>
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

" keep visual selection when indenting/outdenting
vmap < <gv
vmap > >gv

" open NERDTree
map <Leader>n :NERDTreeToggle<CR>

inoremap <C-w><Space> <Esc>/<++><Enter>"_c4l
inoremap jk <Esc>
nnoremap <Leader><Leader> :w<CR>
nnoremap ZZ :wq<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
" nnoremap <C-w>h <C-w>s

autocmd FileType html inoremap ;i <em></em><Space><++><Esc>FeT>i
autocmd FileType html inoremap ;b <b></b><Space><++><Esc>FbT>i
" }}}
