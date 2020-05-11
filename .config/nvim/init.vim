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

" auto change current directory to directory of current file
set autochdir

" if the above causes problems with plugins, here's an alternative way
" autocmd BufEnter * silent! lcd %:p:h

set guifont=FiraCode\ Nerd\ Font\ 12
set conceallevel=2
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

" ======== mattn/emmet-vim config ======== {{{
" https://github.com/mattn/emmet-vim

Plug 'mattn/emmet-vim'

" enable all functions in all modes
let g:user_emmet_mode='a'

" only enable for specific filetypes
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,js,jsx EmmetInstall

" rebind leader to alt-e
let g:user_emmet_leader_key = '<m-e>'

" }}}
" ======== editorconfig/editorconfig-vim config ======== {{{
" https://github.com/editorconfig/editorconfig-vim

Plug 'editorconfig/editorconfig-vim'      

" }}}
" ======== hail2u/vim-css3-syntax config ======== {{{
" https://github.com/hail2u/vim-css3-syntax

Plug 'hail2u/vim-css3-syntax'     

" }}}
" ======== cakebaker/scss-syntax config ======== {{{
" https://github.com/cakebaker/scss-syntax.vim

Plug 'cakebaker/scss-syntax.vim'     

" }}}
" ======== vim-js config ======== {{{
" https://github.com/yuezk/vim-js

Plug 'yuezk/vim-js'

" }}}
" ======== vim-jsx-pretty config ======== {{{
" https://github.com/MaxMEllon/vim-jsx-pretty

Plug 'maxmellon/vim-jsx-pretty', { 'as': 'vim-syntax-jsx', 'for': [ 'javascriptreact' ] }

" }}}
" ======== vim-closetag config ======== {{{
" https://github.com/alvan/vim-closetag

Plug 'alvan/vim-closetag'

" Update closetag to also work on js and html files, don't want ts since <> is used for type args
let g:closetag_filenames='*.html,*.js,*.jsx'
let g:closetag_regions = {
    \ 'javascript.jsx': 'jsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" non-closing tags case sensitive (<Link> !== <link>)
let g:closetag_emptyTags_caseSensitive = 1

" }}}
" ======== auto-pairs config ======== {{{
" https://github.com/jiangmiao/auto-pairs

Plug 'jiangmiao/auto-pairs'

" }}}
" ======== prettier config ======== {{{
" https://github.com/prettier/vim-prettier

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 1
let g:prettier#autoformat_config_present = 1
let g:prettier#quickfix_enabled = 0
let g:prettier#config#single_quote = 'true'
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#trailing_comma = 'all'
autocmd BufWritePre *.js,*.jsx,*.css,*.scss,*.json,*.md,*.yaml,*.html PrettierAsync

" }}}
" ======== ultisnips config ======== {{{
" https://github.com/SirVer/ultisnips

" needed for vim-react-snippets
Plug 'SirVer/ultisnips'

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'

" }}}
" ======== vim-react-snippets config ======== {{{
" https://github.com/mlaursen/vim-react-snippets

Plug 'mlaursen/vim-react-snippets'

" }}}
" ======== vim-surround config ======== {{{
" https://github.com/tpope/vim-surround

Plug 'tpope/vim-surround'

" }}}
" ======== vim-commentary config ======== {{{
" https://github.com/tpope/vim-commentary

Plug 'tpope/vim-commentary'

" example of adding favorite filetype support
" autocmd FileType apache setlocal commentstring=#\ %s

" }}}
" ======== vim-obsession config ======== {{{
" https://github.com/tpope/vim-obsession

Plug 'tpope/vim-obsession'

" `:help obsession-status`
" do I need something to create Session.vim file automatically?

" }}}
" ======== nerdtree config ======== {{{
" https://github.com/preservim/nerdtree

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" always show hidden files
let NERDTreeShowHidden=1

" change default arrows
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" }}}
" ======== nerdtree-git-plugin config ======== {{{
" https://github.com/Xuyuanp/nerdtree-git-plugin

Plug 'Xuyuanp/nerdtree-git-plugin'

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
" ======== vim-tmux config ======== {{{

" Plug 'tmux-plugins/vim-tmux'

" }}}
" ======== vimwiki config ======== {{{
" https://github.com/vimwiki/vimwiki

Plug 'vimwiki/vimwiki'

let g:vimwiki_list = [{'path': '~/refs/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_diary_months = {
  \ 1: 'January', 2: 'February', 3: 'March', 4: 'April', 5: 'May',
  \ 6: 'June', 7: 'July', 8: 'August', 9: 'September', 10: 'October',
  \ 11: 'November', 12: 'December' }

" }}}
" ======== markdown-preview config ======== {{{
" https://github.com/iamcco/markdown-preview.nvim

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

" example
" nmap <C-s> <Plug>MarkdownPreview
" nmap <M-s> <Plug>MarkdownPreviewStop
" nmap <C-p> <Plug>MarkdownPreviewToggle

" }}}
" ======== todo.txt config ======== {{{
" https://github.com/freitass/todo.txt-vim

Plug 'freitass/todo.txt-vim'

" }}}
" ======== goyo config ======== {{{
" https://github.com/junegunn/goyo.vim

Plug 'junegunn/goyo.vim'

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
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
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
" ======== limelight config ======== {{{
" https://github.com/junegunn/limelight.vim

Plug 'junegunn/limelight.vim'

" }}}
" ======== fzf config ======== {{{
" https://github.com/junegunn/fzf

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

noremap <leader>f :FZF<cr>

" }}}
" ======== targets config ======== {{{
" https://github.com/wellle/targets.vim

Plug 'wellle/targets.vim'

" }}}
" ======== gruvbox config ======== {{{
" https://github.com/morhetz/gruvbox

Plug 'morhetz/gruvbox'

" }}}
" ======== coc config ======== {{{
" https://github.com/neoclide/coc.nvim

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" longer updatetime = delays/lag (default is 4000ms)
set updatetime=300

" don't pass messages to |ins-completion-menu|
set shortmess+=c

let g:coc_global_extensions=[
  \ 'coc-css',
  \ 'coc-scssmodules',
  \ 'coc-emmet',
  \ 'coc-git',
  \ 'coc-html',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-snippets',
  \ 'coc-tsserver',
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
" https://github.com/tjdevries/coc-zsh

Plug 'tjdevries/coc-zsh'

" }}}
" ======== vim-ditto config ======== {{{
" https://github.com/dbmrq/vim-ditto

Plug 'dbmrq/vim-ditto'

" vim-ditto settings https://github.com/dbmrq/vim-ditto
au FileType markdown,text,tex DittoOn " turn on ditto's autocmds
nmap <leader>di <Plug>ToggleDitto     " turn ditto on and off

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
" ======== tmuxline config ======== {{{

Plug 'sainnhe/tmuxline.vim'

" }}}
" ======== vim-devicons config ======== {{{

Plug 'ryanoasis/vim-devicons'

" }}}
" ======== vim-easymotion config ======== {{{

" Plug 'Lokaltog/vim-easymotion'    

" }}}
" ======== vim-nerdtree-syntax-highlight config ======== {{{
" https://github.com/tiagofumo/vim-nerdtree-syntax-highlight

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" NERDTrees File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
" call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

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

call plug#end()

" }}}
" ======== misc config ======== {{{

" vimscript file settings -------------------- {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" }}}
" ======== lightline config ======== {{{
"{{{lightline.vim
"{{{lightline.vim-usage
" :h 'statusline'
" :h g:lightline.component
"}}}
"{{{functions
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
        \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'vim-obsession' ],
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
        \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'vim-obsession' ],
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
      \ 'vim-obsession': '%{ObsessionStatus()}',
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
" ======== vim folds ======== {{{

" set auto saving/restoring of vim folds
" currently causes issues, unsure why
" au BufWinLeave * mkview
" au BufWinEnter * silent loadview

" }}}
" ======== functions ======== {{{

" Make it so that if files are changed externally (ex: changing git branches) update the vim buffers automatically
" autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" autocmd FileChangedShellPost *
"   \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" open terminal at bottom with :T or right with :VT
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

" === nerdtree === {{{

" start nerdtree if starting vim by opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" start nerdtree on start-up if no files specified
" but not when opening a saved session
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif

" close nvim if the only window left is NERDTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
" ======== color config ======== {{{

set termguicolors
set background=light
let g:gruvbox_contrast_light = 'hard'
colorscheme gruvbox

" }}}
" ======== key maps ======== {{{

command PIU PlugInstall | PlugUpdate | PlugUpgrade
map <F6> :setlocal spell! spelllang=en_us<cr>
" map! <F5> :so $MYVIMRC<cr>
nnoremap <leader>S :%s///g<left><left><left>

" open nerdtree
map <leader>n :NERDTreeToggle<cr>

" add semicolon, colon, comma to eol
nnoremap <leader>; m'A;<esc>`'
nnoremap <leader>, m'A,<esc>`'
nnoremap <leader>: m'A:<esc>`'

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
" ======== ideas ======== {{{

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

" }}}

