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
" set scrolloff=15
set shiftwidth=2
set showcmd
set showmatch
" set sidescrolloff=15
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
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/artify.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'macthecadillac/lightline-gitdiff'
Plug 'maximbaz/lightline-ale'
Plug 'albertomontesg/lightline-asyncrun'
Plug 'rmolin88/pomodoro.vim'
Plug 'sainnhe/tmuxline.vim'
call plug#end()

" set syntax highlighting for config files
autocmd BufNewFile,BufRead .aliases set filetype=sh
" autocmd BufNewFile,BufRead *.conf set filetype=sh
autocmd BufNewFile,BufRead config set filetype=sh
autocmd BufNewFile,BufRead *.code-workspace set filetype=json

" Vimscript file settings -------------------- {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" ======== Color Config ========

" gruvbox-material configuration
" set termguicolors
" set background=light
" let g:gruvbox_material_background = 'hard'
" colorscheme gruvbox-material

" gruvbox configuration
set termguicolors
set background=light
let g:gruvbox_contrast_light = 'hard'
colorscheme gruvbox

" ======== lightline Config ========

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
" function! CocCurrentFunction()"{{{
"     return get(b:, 'coc_current_function', '')
" endfunction"}}}
" function! Devicons_Filetype()"{{{
"     " return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : 'no ft') : ''
"     return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
" endfunction"}}}
" function! Devicons_Fileformat()"{{{
"     return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
" endfunction"}}}
function! Artify_active_tab_num(n) abort"{{{
    return Artify(a:n, 'bold')." \ue0bb"
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
let g:lightline = {}
" let g:lightline.colorscheme = 'gruvbox_material'
let g:lightline.colorscheme = 'gruvbox'
let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
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
let g:lightline.tab_component = {
            \ }
let g:lightline.tab_component_function = {
            \ 'artify_activetabnum': 'Artify_active_tab_num',
            \ 'artify_inactivetabnum': 'Artify_inactive_tab_num',
            \ 'artify_filename': 'Artify_lightline_tab_filename',
            \ 'filename': 'lightline#tab#filename',
            \ 'modified': 'lightline#tab#modified',
            \ 'readonly': 'lightline#tab#readonly',
            \ 'tabnum': 'lightline#tab#tabnum'
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
            \ 'gitbranch': 'gitbranch#name',
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
 
" ======== tmuxline Config ========

if executable('tmux') && filereadable(expand('~/.zshrc')) && $TMUX !=# ''
  let g:vimIsInTmux = 1
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
  " let g:tmuxline_theme = 'lightline'
else
  let g:vimIsInTmux = 0
endif

"{{{tmuxline.vim
if g:vimIsInTmux == 1
  let g:tmuxline_preset = {
              \'a'    : '#S',
              \'b'    : '%R',
              \'c'    : [ '#{sysstat_mem} #[fg=blue]\ufa51#{upload_speed}' ],
              \'win'  : [ '#I', '#W' ],
              \'cwin' : [ '#I', '#W', '#F' ],
              \'x'    : [ "#[fg=blue]#{download_speed} \uf6d9 #{sysstat_cpu}" ],
              \'y'    : [ '%a' ],
              \'z'    : '#H #{prefix_highlight}'
              \}
  let g:tmuxline_separators = {
              \ 'left' : "\ue0bc",
              \ 'left_alt': "\ue0bd",
              \ 'right' : "\ue0ba",
              \ 'right_alt' : "\ue0bd",
              \ 'space' : ' '}
endif
"}}}

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

command PIU PlugInstall | PlugUpdate | PlugUpgrade
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

