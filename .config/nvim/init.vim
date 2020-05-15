" nvim config file
" created by Nick Garcia
" https://github.com/NicksIdeaEngine/dotfiles

" {{{ table of contents

" 0. globals
" 1. plugin call
" 2. plugin config
" 3. general config
" 4. lightline config
" 5. functions
" 6. key maps
" z. overflow

" }}}
" 0. globals {{{

let mapleader=' '           " Leader The Way
nnoremap <space> <nop>      " remove default space bindings
filetype plugin indent on   " 
syntax enable               " turn on syntax highlighting

" }}}
" 1. plugin call {{{

call plug#begin()
" https://github.com/mattn/emmet-vim
Plug 'mattn/emmet-vim'

" https://github.com/editorconfig/editorconfig-vim
Plug 'editorconfig/editorconfig-vim'      

" https://github.com/hail2u/vim-css3-syntax
Plug 'hail2u/vim-css3-syntax'     

" https://github.com/cakebaker/scss-syntax.vim
Plug 'cakebaker/scss-syntax.vim'     

" https://github.com/yuezk/vim-js
Plug 'yuezk/vim-js'

" https://github.com/MaxMEllon/vim-jsx-pretty
Plug 'maxmellon/vim-jsx-pretty', { 'as': 'vim-syntax-jsx', 'for': [ 'javascriptreact' ] }

" https://github.com/alvan/vim-closetag
Plug 'alvan/vim-closetag'

" https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'

" https://github.com/prettier/vim-prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" https://github.com/SirVer/ultisnips
Plug 'SirVer/ultisnips'

" https://github.com/mlaursen/vim-react-snippets
Plug 'mlaursen/vim-react-snippets'

" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'

" https://github.com/tpope/vim-obsession
Plug 'tpope/vim-obsession'

" https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" https://github.com/vimwiki/vimwiki
Plug 'vimwiki/vimwiki'

" https://github.com/iamcco/markdown-preview.nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

" https://github.com/freitass/todo.txt-vim
Plug 'freitass/todo.txt-vim'

" https://github.com/junegunn/goyo.vim
Plug 'junegunn/goyo.vim'

" https://github.com/junegunn/limelight.vim
Plug 'junegunn/limelight.vim'

" https://github.com/junegunn/fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" https://github.com/wellle/targets.vim
Plug 'wellle/targets.vim'

" https://github.com/morhetz/gruvbox
Plug 'morhetz/gruvbox'

" https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" https://github.com/tjdevries/coc-zsh
Plug 'tjdevries/coc-zsh'

" https://github.com/dbmrq/vim-ditto
Plug 'dbmrq/vim-ditto'

" https://github.com/justinmk/vim-sneak
Plug 'justinmk/vim-sneak'

Plug 'itchyny/lightline.vim'

Plug 'itchyny/vim-gitbranch'

Plug 'sainnhe/artify.vim'

Plug 'macthecadillac/lightline-gitdiff'

Plug 'maximbaz/lightline-ale'

Plug 'albertomontesg/lightline-asyncrun'

Plug 'sainnhe/tmuxline.vim'

Plug 'ryanoasis/vim-devicons'

Plug 'francoiscabrol/ranger.vim'

Plug 'rbgrouleff/bclose.vim'

" https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()

" }}}
" 2. plugin config {{{

" mattn/emmet-vim config {{{

" enable all functions in all modes
let g:user_emmet_mode='a'

" only enable for specific filetypes
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,js,jsx EmmetInstall

" rebind leader to alt-e
let g:user_emmet_leader_key = '<m-e>'

" }}}
" vim-closetag config {{{

" Update closetag to also work on js and html files, don't want ts since <> is used for type args
let g:closetag_filenames='*.html,*.js,*.jsx'
let g:closetag_regions = {
    \ 'javascript.jsx': 'jsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" non-closing tags case sensitive (<Link> !== <link>)
let g:closetag_emptyTags_caseSensitive = 1

" }}}
" prettier config {{{

let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 1
let g:prettier#autoformat_config_present = 1
let g:prettier#quickfix_enabled = 0
let g:prettier#config#single_quote = 'true'
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#trailing_comma = 'all'
autocmd BufWritePre *.js,*.jsx,*.css,*.scss,*.json,*.md,*.yaml,*.html PrettierAsync

" }}}
" ultisnips config {{{

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'

" }}}
" vim-commentary config {{{

" example of adding favorite filetype support
" autocmd FileType apache setlocal commentstring=#\ %s

" }}}
" vim-obsession config {{{

" `:help obsession-status`
" do I need something to create Session.vim file automatically?

" }}}
" nerdtree config {{{

" always show hidden files
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automatically close nvim if NERDTree is only thing left open

" change default arrows
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" start nerdtree if starting vim by opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" start nerdtree on start-up if no files specified
" but not when opening a saved session
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif

" close nvim if the only window left is NERDTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" }}}
" nerdtree-git-plugin config {{{

let g:NERDTreeShowIgnoredStatus = 1

" let g:NERDTreeIndicatorMapCustom = {
"     \ "Modified"  : "✹",
"     \ "Staged"    : "✚",
"     \ "Untracked" : "✭",
"     \ "Renamed"   : "➜",
"     \ "Unmerged"  : "═",
"     \ "Deleted"   : "✖",
"     \ "Dirty"     : "✗",
"     \ "Clean"     : "✔︎",
"     \ "Ignored"   : "☒",
"     \ "Unknown"   : "?"
"     \ }

" }}}
" vimwiki config {{{

let g:vimwiki_list = [{'path': '~/refs/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_diary_months = {
  \ 1: 'January', 2: 'February', 3: 'March', 4: 'April', 5: 'May',
  \ 6: 'June', 7: 'July', 8: 'August', 9: 'September', 10: 'October',
  \ 11: 'November', 12: 'December' }

" }}}
" markdown-preview config {{{

" example
" nmap <C-s> <Plug>MarkdownPreview
" nmap <M-s> <Plug>MarkdownPreviewStop
" nmap <C-p> <Plug>MarkdownPreviewToggle

" }}}
" goyo config {{{

let g:goyo_width = 95
let g:goyo_height = 85
let g:goyo_linenr = 0
augroup goyoCustom
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
augroup END

" focus mode
nnoremap <silent> <leader><leader>f :<c-u>Limelight!!<cr>

" reading mode
nnoremap <silent> <leader><leader>r :<c-u>Goyo<cr>

" ensure `:q` quits even when Goyo is active
function! s:goyo_enter()
  set nonu nornu
  exe 'CocCommand git.toggleGutters'
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  set nu rnu
  exe 'CocCommand git.toggleGutters'
  
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

" }}}
" fzf config {{{

nnoremap <leader>f :FZF<cr>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-c': 'split',
  \ 'ctrl-v': 'vsplit'
  \ }

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" matching fzf colors to theme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" }}}
" coc config {{{

" longer updatetime = delays/lag (default is 4000ms)
set updatetime=300

" don't pass messages to |ins-completion-menu|
set shortmess+=c

let g:coc_global_extensions=[
  \ 'coc-css',
  \ 'coc-emmet',
  \ 'coc-eslint',
  \ 'coc-git',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-scssmodules',
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ ]

inoremap <silent><expr> <leader>;
  \ pumvisible() ? "\<c-n>" :
  \ <SID>check_back_space() ? "\<tab>" :
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
" ranger.vim config {{{

let g:ranger_map_keys = 0
let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 1
map <leader>l :Ranger<cr>
map <leader>L :RangerNewTab<cr>

" }}}
" vim-ditto config {{{

" vim-ditto settings https://github.com/dbmrq/vim-ditto
au FileType markdown,text,tex DittoOn " turn on ditto's autocmds
nmap <leader>di <Plug>ToggleDitto     " turn ditto on and off

" }}}
" vim-nerdtree-syntax-highlight config {{{

" NERDTrees File highlighting
" function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
"  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
"  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
" endfunction

" call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
" call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
" call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
" call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
" call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
" autocmd VimEnter * call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
" " call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
" call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
" call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
" call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
" call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
" call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
" call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

" " highlight full name, not just icons
" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:NERDTreeExactMatchHighlightFullName = 1
" let g:NERDTreePatternMatchHighlightFullName = 1

" let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
" let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" " you can add these colors to your .vimrc to help customizing
" let s:brown = "905532"
" let s:aqua =  "3AFFDB"
" let s:blue = "689FB6"
" let s:darkBlue = "44788E"
" let s:purple = "834F79"
" let s:lightPurple = "834F79"
" let s:red = "AE403F"
" let s:beige = "F5C06F"
" let s:yellow = "F09F17"
" let s:orange = "D4843E"
" let s:darkOrange = "F16529"
" let s:pink = "CB6F6F"
" let s:salmon = "EE6E73"
" let s:green = "8FAA54"
" let s:lightGreen = "31B53E"
" let s:white = "FFFFFF"
" let s:rspec_red = 'FE405F'
" let s:git_orange = 'F54D27'

" let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
" let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

" let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
" let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

" let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
" let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

" }}}
" vim-devicons config {{{

" placeholder

" }}}

" }}}
" 3. general config {{{

" colors
if (has("termguicolors"))
  set termguicolors
endif
set background=light
let g:gruvbox_contrast_light = 'hard'
colorscheme gruvbox

" set relative numbers
set number relativenumber

" only enable relative numbers for focused, non-insert mode window
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" reload files changed outside of vim
set autoread

" save on losing focus, leaving buffer, or leaving insert mode
au BufLeave,FocusLost,InsertLeave * :wa

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

" show matching brackets when text indicator is over them
set showmatch

" suggestion for normal mode commands
set wildmode=list:longest
set wildignore+=*.swp,*.bak,**/node_modules/**,**/.git/**

" add current path to path
set path+=**

" indentation
set expandtab       " use spaces instead of tabs
set autoindent      " autoindent based on line above
set smartindent     " smarter indent for C-like languages
set smarttab        " smarter tab for C-like languages
set shiftwidth=2    " when reading, tabs are 2 spaces
set softtabstop=2   " in insert mode, tabs are 2 spaces

" wrapping
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80

" set syntax highlighting for config files
autocmd BufNewFile,BufRead .aliases set filetype=sh
autocmd BufNewFile,BufRead config set filetype=sh
autocmd BufNewFile,BufRead *.code-workspace set filetype=json

" turn on spell check for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell

" For regular expressions turn magic on
set magic

" auto change current directory to directory of current file
set autochdir

" if the above causes problems with plugins, here's an alternative way
" autocmd BufEnter * silent! lcd %:p:h

" open new splits to right and below
set splitbelow
set splitright

" highlight line where cursor is
set cursorline

" ignore case when searching 
set ignorecase

" enable case when searching if capital is typed
set smartcase

" no beeps
set visualbell
set noerrorbells

" better history management
set history=1000 "remember more commands and search history
set undolevels=1000 "use many levels of undo
set nobackup " stop vim from creating backup files
set noswapfile " stop vim from creating swap files

set guifont=FiraCode\ Nerd\ Font\ 12
set conceallevel=2
set foldenable
set foldlevelstart=10
set foldmethod=marker
set foldnestmax=10
set linebreak
set rulerformat=%l,%v
set showcmd
set sidescroll=1
set tabstop=2 " tab is two spaces
set timeoutlen=1000

" set host_prog path to python executable
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" vimscript file settings 
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}
" 4. lightline config {{{
" {{{lightline.vim
" {{{ functions
function! CocCurrentFunction() " {{{
  return get(b:, 'coc_current_function', '')
endfunction " }}}
function! Devicons_Filetype() " {{{
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction " }}}
function! Artify_active_tab_num(n) abort " {{{
  return Artify(a:n, 'bold')." \ue0b1"
endfunction " }}}
function! Tab_num(n) abort " {{{
  return a:n." \ue0b1"
endfunction " }}}
function! Gitbranch() abort " {{{
  if gitbranch#name() !=# ''
    return gitbranch#name()." \ue725"
  else
    return "\ue61b"
  endif
endfunction " }}}
function! Artify_inactive_tab_num(n) abort " {{{
  return Artify(a:n, 'double_struck')." \ue0b1"
endfunction " }}}
function! Artify_lightline_tab_filename(s) abort " {{{
  return Artify(lightline#tab#filename(a:s), 'monospace')
endfunction " }}}
function! Artify_lightline_mode() abort " {{{
  return Artify(lightline#mode(), 'monospace')
endfunction " }}}
function! Artify_line_percent() abort " {{{
  return Artify(string((100*line('.'))/line('$')), 'bold')
endfunction " }}}
function! Artify_line_num() abort " {{{
  return Artify(string(line('.')), 'bold')
endfunction " }}}
function! Artify_col_num() abort " {{{
  return Artify(string(getcurpos()[2]), 'bold')
endfunction " }}}
function! Artify_gitbranch() abort " {{{
  if gitbranch#name() !=# ''
    return Artify(gitbranch#name(), 'monospace')." \ue725"
  else
    return "\ue61b"
  endif
endfunction " }}}
 " }}}
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
let g:lightline.tabline_subseparator = { 'left': "\ue621", 'right': "\ue621" }
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
      \           [ 'readonly', 'filename', 'modified', 'devicons_filetype' ] ],
      \ 'right': [ [ 'artify_lineinfo' ],
      \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'vim-obsession' ],
      \           [ 'asyncrun_status', 'coc_status' ] ]
      \ }
let g:lightline.inactive = {
      \ 'left': [ [ 'filename' , 'modified', 'devicons_filetype' ]],
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
      \ 'artify_lineinfo': "%2{Artify_line_percent()}\uf295 \ue0a1%3{Artify_line_num()}:%-2{Artify_col_num()}",
      \ 'gitstatus' : '%{lightline_gitdiff#get_status()}',
      \ 'bufinfo': '%{bufname("%")}:%{bufnr("%")}',
      \ 'vim_logo': "\ue7c5",
      \ 'vim-obsession': '%{ObsessionStatus()}',
      \ 'mode': '%{lightline#mode()}',
      \ 'absolutepath': '%F',
      \ 'relativepath': '%f',
      \ 'filename': '%t',
      \ 'filesize': "%{HumanSize(line2byte('$') + len(getline('$')))}",
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
" }}}
" }}}
" 5. functions {{{

" Make it so that if files are changed externally (ex: changing git branches) update the vim buffers automatically
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" integrated terminal {{{

" turn terminal to normal mode with escape
tnoremap <esc> <c-\><c-n>

" move between panels while in terminal mode
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l
tnoremap <c-h> <c-\><c-n><c-w>h

" <c-n> will also close ternimal
tnoremap <c-n> :q<cr>

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on <c-n>
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction

nnoremap <c-n> :call OpenTerminal()<cr>

nnoremap <silent> <m-z> :call nvim_open_win(bufnr('%'), v:true, {'relative': 'editor', 'anchor': 'NW', 'width': winwidth(0), 'height': 2*winheight(0)/5, 'row': 1, 'col': 0})<CR>:call TerminalToggle()<CR>
tnoremap <silent> <m-z> <C-\><C-n>:call TerminalToggle()<CR>:q<CR>

function! TerminalCreate() abort
  if !has('nvim')
    return v:false
  endif

  if !exists('g:terminal')
    let g:terminal = {
      \ 'opts': {},
      \ 'term': {
        \ 'loaded': v:null,
        \ 'bufferid': v:null
      \ },
      \ 'origin': {
        \ 'bufferid': v:null
      \ }
    \ }

    function! g:terminal.opts.on_exit(jobid, data, event) abort
      silent execute 'buffer' g:terminal.origin.bufferid
      silent execute 'bdelete!' g:terminal.term.bufferid

      let g:terminal.term.loaded = v:null
      let g:terminal.term.bufferid = v:null
      let g:terminal.origin.bufferid = v:null
    endfunction
  endif

  if g:terminal.term.loaded
    return v:false
  endif

  let g:terminal.origin.bufferid = bufnr('')

  enew
  call termopen(&shell, g:terminal.opts)

  let g:terminal.term.loaded = v:true
  let g:terminal.term.bufferid = bufnr('')
  startinsert
endfunction

function! TerminalToggle()
  if !has('nvim')
    return v:false
  endif

  " Create the terminal buffer.
  if !exists('g:terminal') || !g:terminal.term.loaded
    return TerminalCreate()
  endif

  " Go back to origin buffer if current buffer is terminal.
  if g:terminal.term.bufferid ==# bufnr('')
    silent execute 'buffer' g:terminal.origin.bufferid

  " Launch terminal buffer and start insert mode.
  else
    let g:terminal.origin.bufferid = bufnr('')

    silent execute 'buffer' g:terminal.term.bufferid
    startinsert
  endif
endfunction

" }}}
" windows like clipboard {{{

" yank to and paste from the clipboard without prepending "* to commands
let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'

" map c-x and c-v to work as they do in windows, only in insert mode
vm <c-x> "+x
vm <c-c> "+y
cno <c-v> <c-r>+
exe 'ino <script> <c-V>' paste#paste_cmd['i']

" }}}
" }}}
" 6. key maps {{{

command PIU PlugInstall | PlugUpdate | PlugUpgrade
map <F6> :setlocal spell! spelllang=en_us<cr>
" map! <F5> :so $MYVIMRC<cr>
nnoremap <leader>s :%s///g<left><left><left>

" open nerdtree
map <leader>n :NERDTreeToggle<cr>

" add semicolon, colon, comma to eol
nnoremap <leader>; m'A;<esc>`'
nnoremap <leader>, m'A,<esc>`'
nnoremap <leader>: m'A:<esc>`'

" edit/reload init.vim file
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

" change directory to folder of current file
nnoremap <leader>cd :cd %:p:h<cr>

" turn off search highlight
nnoremap <leader>h :nohlsearch<cr>

" coc hotkeys
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nnoremap <c-p> :GFiles<cr>

" switch line downwards/upwards
nnoremap <leader>j ddp
nnoremap <leader>k ddkP
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" map Y like D and C
map Y y$

" select all
noremap <leader>a ggVG

" sort CSS properties
nnoremap <leader><leader>s ?{<cr>jV/^\s*\}?$<cr>k:sort<cr>:noh<cr>

" open/close folds
nnoremap <leader>/ za

" search for current selection
vnoremap <silent> * :call VisualSelection('f')<cr>
vnoremap <silent> # :call VisualSelection('b')<cr>

" search and replace selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<cr>

" highlight last inserted text
nnoremap gV `[v`]

" keep visual selection when indenting/outdenting
vmap < <gv
vmap > >gv

" smarter vim searching that turns off vim's default regex characters
nnoremap / /\v
vnoremap / /\v

" surround visual selection in symbol
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

inoremap <c-w><Space> <esc>/<++><enter>"_c4l
inoremap jk <esc>
inoremap <esc> <nop>
inoremap \<Tab> <esc>V><esc>la
inoremap \<S-Tab> <esc>V<<esc>la
nnoremap <leader><leader> :w<cr>
nnoremap ZZ :wq<cr>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <m-j> :res -1<cr>
nnoremap <m-k> :res +1<cr>
nnoremap <m-l> :vertical res +1<cr>
nnoremap <m-h> :vertical res -1<cr>
" nnoremap <c-w>h <c-w>s

autocmd FileType html inoremap ;i <em></em><Space><++><esc>FeT>i
autocmd FileType html inoremap ;b <b></b><Space><++><esc>FbT>i

if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" }}}
" z. overflow {{{

" `npm run devserver`
" deploy workspace setups
" snippets and snippet searching (with fzf?)
" markdown open preview
" vertical/horizontal split
" moving editors around to different panes
" beautify for HTML
" eslint
" indent rainbow
" intellisense
" working nerdtree icons
" rescuetime
" wakatime
" remove vim and vim icon
" remove the utf-8 section
" add timers for rescuetime / wakatime
" add todotxt.cli integration
" ranger
" image viewing?
" startify
" vim-which-key
" polyglot
" colorizer
" echodoc
" rainbow
" pane/split movement?

" }}}

