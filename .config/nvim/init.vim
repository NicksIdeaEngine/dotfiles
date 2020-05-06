" ======== summary ======== {{{
"
" }}}
" ======== general config ======== {{{

" turn on syntax highlighting
syntax on

" set relative numbers
set nu rnu

" only enable relative numbers for focused, non-insert mode window
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" reload files changed outside of vim
set autoread

" don't redraw screen while running macros, registers, or other non-typed comments
set lazyredraw

" send buffers to stay in background (instead of unloading) when abandoned
set hidden

" map <leader>q and <leader>w to buffer prev/next buffer
noremap <leader>q :bp<cr>
noremap <leader>w :bn<cr>

" find next match while typing search
set incsearch

" enable highlighting while searching
set hlsearch

" suggestion for normal mode commands
set wildmode=list:longest

" indentation
set expandtab       " use spaces instead of tabs
set autoindent      " autoindent based on line above
set smartindent     " smarter indent for C-like languages
set smarttab        " smarter tab for C-like languages
set shiftwidth=2    " when reading, tabs are 2 spaces
set softtabstop=2   " in insert mode, tabs are 2 spaces

" set syntax highlighting for config files
autocmd BufNewFile,BufRead .aliases set filetype=sh
" autocmd BufNewFile,BufRead *.conf set filetype=sh
autocmd BufNewFile,BufRead config set filetype=sh
autocmd BufNewFile,BufRead *.code-workspace set filetype=json

" For regular expressions turn magic on
set magic

set cursorline
set foldenable
set foldlevelstart=10
set foldmethod=marker
set foldnestmax=10
set ignorecase          " ignore case when searching
set linebreak
set rulerformat=%l,%v
set showcmd
set showmatch " show matching brackets when text indicator is over them
set sidescroll=1
set smartcase           " enable case when searching if capital is typed
set spell
set splitbelow
set splitright
set tabstop=2
set timeoutlen=1000

let mapleader="\<Space>"

" set host_prog path to python executable
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" }}}
" ======== plugin config ======== {{{

call plug#begin()

" ======== emmet-vim config ======== {{{

Plug 'mattn/emmet-vim'

" let g:user_emmet_leader_key = '<c-e>'

" }}}
" ======== editorconfig-vim config ======== {{{

" Plug 'editorconfig/editorconfig-vim'      

" }}}
" ======== vim-css-color config ======== {{{

" Plug 'skammer/vim-css-color'      

" }}}
" ======== vim-css3-syntax config ======== {{{

" Plug 'hail2u/vim-css3-syntax'     

" }}}
" ======== scss-syntax config ======== {{{

" Plug 'cakebaker/scss-syntax.vim'     

" }}}
" ======== vim-javascript config ======== {{{

" Plug 'pangloss/vim-javascript'     

" }}}
" ======== vim-jsx config ======== {{{

" Plug 'mxw/vim-jsx'     
" let g:jsx_ext_required=0

" }}}
" ======== vim-closetag config ======== {{{

" Plug 'alvan/vim-closetag'
" Update closetag to also work on js and html files, don't want ts since <> is used for type args
" let g:closetag_filenames='*.html,*.css,*.scss,*.js,*.jsx,*.json'
" let g:closetag_regions = {
"     \ 'javascript.jsx': 'jsxRegion',
"     \ 'javascriptreact': 'jsxRegion',
"     \ }

" }}}
" ======== auto-pairs config ======== {{{

" Plug 'jiangmiao/auto-pairs'

" }}}
" ======== vim-jsx-pretty config ======== {{{

Plug 'maxmellon/vim-jsx-pretty', { 'as': 'vim-syntax-jsx', 'for': [ 'javascriptreact' ] }

" }}}
" ======== prettier config ======== {{{

Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'css', 'scss', 'json', 'markdown', 'yaml', 'html'] }

let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 0
let g:prettier#quickfix_enabled = 0
let g:prettier#config#single_quote = 'true'
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#trailing_comma = 'es5'
autocmd BufWritePre *.js,*.jsx,*.css,*.scss,*.json,*.md,*.yaml,*.html PrettierAsync

" }}}
" ======== ultisnips config ======== {{{

" needed for vim-react-snippets
Plug 'SirVer/ultisnips'

" }}}
" ======== vim-react-snippets config ======== {{{

Plug 'mlaursen/vim-react-snippets'

" }}}
" ======== react-md config ======== {{{

Plug 'mlaursen/react-md'

" }}}
" ======== vim-surround config ======== {{{

Plug 'tpope/vim-surround'

" }}}
" ======== vim-commentary config ======== {{{

Plug 'tpope/vim-commentary'

" }}}
" ======== vim-obsession config ======== {{{

Plug 'tpope/vim-obsession'

" }}}
" ======== nerdtree config ======== {{{

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" always show hidden files
let NERDTreeShowHidden=1

" change default arrows
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" }}}
" ======== nerdtree-git-plugin config ======== {{{

Plug 'Xuyuanp/nerdtree-git-plugin'

" }}}
" ======== vim-tmux config ======== {{{

Plug 'tmux-plugins/vim-tmux'

" }}}
" ======== vimwiki config ======== {{{

Plug 'vimwiki/vimwiki'

let g:vimwiki_list = [{'path': '~/refs/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_diary_months = {
  \ 1: 'January', 2: 'February', 3: 'March', 4: 'April', 5: 'May',
  \ 6: 'June', 7: 'July', 8: 'August', 9: 'September', 10: 'October',
  \ 11: 'November', 12: 'December' }

" }}}
" ======== markdown-preview config ======== {{{

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

" }}}
" ======== todo.txt config ======== {{{

Plug 'freitass/todo.txt-vim'

" }}}
" ======== goyo config ======== {{{

Plug 'junegunn/goyo.vim'

" }}}
" ======== limelight config ======== {{{

Plug 'junegunn/limelight.vim'

" }}}
" ======== fzf config ======== {{{

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

noremap <leader>f :FZF<cr>

" }}}
" ======== targets config ======== {{{

Plug 'wellle/targets.vim'

" }}}
" ======== gruvbox config ======== {{{

Plug 'morhetz/gruvbox'

" }}}
" ======== coc config ======== {{{

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" longer updatetime = delays/lag (default is 4000ms)
set updatetime=300

" don't pass messages to |ins-completion-menu|
set shortmess+=c

let g:coc_global_extensions=[
  \ 'coc-css',
  \ 'coc-scssmodules',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-snippets',
  \ ]

inoremap <silent><expr> <c-e>
  \ pumvisible() ? "\<c-n>" :
  \ <SID>check_back_space() ? "\<c-e>" :
  \ coc#refresh()
inoremap <expr><c-r> pumvisible() ? "\<c-p>" : "\<c-h>"

function! s:check_back_space() abort
  let col = col('.') -1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" let g:coc_snippet_next = '<c-semicolon>'
" let g:coc_snippet_prev = '<m-semicolon>'

" use <c-space> to trigger completion
" inoremap <silent><expr> <c-space> coc#refresh()

" }}}
" ======== coc-zsh config ======== {{{

Plug 'tjdevries/coc-zsh'

" }}}
" ======== vim-ditto config ======== {{{

Plug 'dbmrq/vim-ditto'

" }}}
" ======== lightline config ======== {{{

Plug 'itchyny/lightline.vim'

" }}}
" ======== vim-gitbranch config ======== {{{

Plug 'itchyny/vim-gitbranch'

" }}}
" ======== artify config ======== {{{

Plug 'sainnhe/artify.vim'

" }}}
" ======== lightline-gitdiff config ======== {{{

Plug 'macthecadillac/lightline-gitdiff'

" }}}
" ======== lightlight-ale config ======== {{{

Plug 'maximbaz/lightline-ale'

" }}}
" ======== lightlight-asyncrun config ======== {{{

Plug 'albertomontesg/lightline-asyncrun'

" }}}
" ======== pomodoro config ======== {{{

Plug 'rmolin88/pomodoro.vim'

" }}}
" ======== tmuxline config ======== {{{

Plug 'sainnhe/tmuxline.vim'

" }}}
" ======== vim-devicons config ======== {{{

Plug 'ryanoasis/vim-devicons'

" }}}
" ======== L9 config ======== {{{

" Plug 'vim-scripts/L9'

" }}}
" ======== vim-easymotion config ======== {{{

" Plug 'Lokaltog/vim-easymotion'    

" }}}

call plug#end()

" }}}
" ======== misc config ======== {{{

" vim-ditto settings https://github.com/dbmrq/vim-ditto
au FileType markdown,text,tex DittoOn " turn on ditto's autocmds
nmap <leader>di <Plug>ToggleDitto     " turn ditto on and off

" vimscript file settings -------------------- {{{
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
nnoremap <silent> <leader><leader>f :<c-u>Limelight!!<cr>
nnoremap <silent> <leader><leader>r :<c-u>Goyo<cr>
" let g:which_key_map["\<space>"]['f'] = 'focus mode'
" let g:which_key_map["\<space>"]['r'] = 'reading mode'
"}}}
" }}}
" ======== color config ======== {{{

" gruvbox configuration
set termguicolors
set background=light
let g:gruvbox_contrast_light = 'hard'
colorscheme gruvbox

" }}}
" ======== lightline config ======== {{{
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
" vim folds {{{

" set auto saving/restoring of vim folds
" au BufWinLeave * mkview
" au BufWinEnter * silent loadview

" }}}
" ======== key mapping config ======== {{{

command PIU PlugInstall | PlugUpdate | PlugUpgrade
map <F6> :setlocal spell! spelllang=en_us<cr>
" map! <F5> :so $MYVIMRC<cr>
nnoremap S :%s///g<left><left><left>

" Make it so that if files are changed externally (ex: changing git branches) update the vim buffers automatically
" autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" autocmd FileChangedShellPost *
"   \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

if has("nvim")
  " open terminal with 20 lines always at bottom
  command! -nargs=* T belowright split | resize 20 | terminal <args>
  " open terminal always right
  command! -nargs=* VT botright vsplit | terminal <args>
  " allow esc to exit terminal mode
  tnoremap <ESC> :q<cr>
endif

" session management
" :mksession filename.vim
" vim -S filename.vim

" start nerdtree on start-up if no files specified
" but not when opening a saved session
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif

" close nvim if the only window left is NERDTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" open nerdtree
map <leader>n :NERDTreeToggle<cr>

" windows like clipboard {{{

" yank to and paste from the clipboard without prepending "* to commands
let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'

" map c-x and c-v to work as they do in windows, only in insert mode
vm <c-x> "+x
vm <c-c> "+y
cno <c-v> <c-r>+
exe 'ino <script> <c-V>' paste#paste_cmd['i']

" }}}

" auto indent pasted text
" this creates odd jumping around, needs tweaking
" nnoremap p p=`]<c-o>
" nnoremap P P=`]<c-o>

" add semicolon, colon, comma to eol
nnoremap <leader>; m'A;<esc>`'
nnoremap <leader>, m'A,<esc>`'
nnoremap <leader>: m'A:<esc>`'

" change directory to folder of current file
nnoremap <leader>cd :cd %:p:h<cr>

" turn off search highlight
nnoremap <leader>h :nohlsearch<cr>

" switch line downwards/upwards
nnoremap <leader>j ddp
nnoremap <leader>k ddkP

" select all
noremap <leader>a ggVG

" open/close folds
nnoremap <leader>/ za

" highlight last inserted text
nnoremap gV `[v`]

" keep visual selection when indenting/outdenting
vmap < <gv
vmap > >gv

inoremap <c-w><Space> <esc>/<++><enter>"_c4l
inoremap jk <esc>
inoremap \<Tab> <esc>V><esc>la
inoremap \<S-Tab> <esc>V<<esc>la
nnoremap <leader><leader> :w<cr>
nnoremap ZZ :wq<cr>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <m-j> <c-w>J
nnoremap <m-k> <c-w>K
nnoremap <m-l> <c-w>L
nnoremap <m-h> <c-w>H
" nnoremap <c-w>h <c-w>s

autocmd FileType html inoremap ;i <em></em><Space><++><esc>FeT>i
autocmd FileType html inoremap ;b <b></b><Space><++><esc>FbT>i
" }}}

