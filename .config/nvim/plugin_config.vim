" plugin_config.vim file
" created by Nick Garcia
" https://github.com/NicksIdeaEngine/dotfiles

" syntax & formatting {{{

" editorconfig/editorconfig-vim {{{
" https://github.com/editorconfig/editorconfig-vim

" }}}
" alvan/vim-closetag {{{
" https://github.com/alvan/vim-closetag

" Update closetag to also work on js and html files, don't want ts since <> is used for type args
let g:closetag_filenames='*.html,*.js,*.jsx'
let g:closetag_regions = {
    \ 'javascript.jsx': 'jsxRegion',
    \ 'javascriptreact': 'jsxRegion' }

" non-closing tags case sensitive (<Link> !== <link>)
let g:closetag_emptyTags_caseSensitive = 1

" }}}
" jiangmiao/auto-pairs {{{
" https://github.com/jiangmiao/auto-pairs

" }}}
" chiel92/vim-autoformat {{{
" https://github.com/chiel92/vim-autoformat

let g:formatdef_rustfmt = '"rustfmt"'
let g:formatters_rust = ['rustfmt']

" }}}
" sheerun/vim-polyglot {{{
" https://github.com/sheerun/vim-polyglot

" }}}
" prettier/vim-prettier {{{
" https://github.com/prettier/vim-prettier

" make prettier asynchronous
let g:prettier#exec_cmd_async = 1

" autoformat if config present
let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_config_files = ['prettier.config.js', '.prettierrc']

" disable auto opening of quickfix
let g:prettier#quickfix_enabled = 0

" run prettier on every save
autocmd BufWritePre *.html,*.css,*.scss,*.js,*.jsx,*.json,*.md,*.mdx,*.wiki PrettierAsync

" }}}
" nvie/vim-flake8 {{{
" https://github.com/nvie/vim-flake8

" disable autopopup quickfix window
let g:flake8_show_quickfix=0

" run flake8 on every save
autocmd BufWritePost *.py call flake8#Flake8()

" }}}
" psf/black {{{
" https://github.com/psf/black

" run black before every save
autocmd BufWritePre *.py execute ':Black'

" }}}
" rust-lang/rust.vim {{{
" https://github.com/rust-lang/rust.vim

" }}}
" racer-rust/vim-racer {{{
" https://github.com/racer-rust/vim-racer

let g:racer_experimental_completer = 1

" }}}

" }}}
" completion, linting, & intellisense {{{

" mattn/emmet-vim {{{
" https://github.com/mattn/emmet-vim

" enable all functions in all modes
let g:user_emmet_mode='a'

" only enable for specific filetypes
let g:user_emmet_install_global = 0

" rebind leader to alt-e
let g:user_emmet_leader_key = '<m-i>'

" start emmet for certain syntaxes
autocmd FileType html,css,scss,js,jsx EmmetInstall

" }}}
" dense-analysis/ale {{{
" https://github.com/dense-analysis/ale

let g:ale_lint_delay = 200              " millisecs
let g:ale_fix_on_save = 1               " autofix on save
let g:ale_lint_on_save = 1              " autolint on save
let g:ale_sign_column_always = 0        " don't keep gutters open
let g:ale_list_window_size = 10         " ALE error list height
let g:ale_open_list = 0                 " disable autopopup fix window
let g:ale_sign_error = "##"
let g:ale_sign_warning = "~~"

" global and language specific options
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'graphql': ['eslint', 'prettier'],
      \ 'javascript.jsx': ['eslint', 'prettier'],
      \ 'javascript': ['eslint', 'prettier'],
      \ 'typescript': ['eslint', 'prettier'] }

let g:ale_linter_aliases = {
      \ 'jsx': ['css', 'javascript'],
      \ 'js': ['css', 'javascript'] }

let g:ale_linters = {
      \ 'graphql': ['eslint', 'flow'],
      \ 'javascript.jsx': ['eslint', 'flow'],
      \ 'javascript': ['eslint', 'flow'],
      \ 'typescript': ['typescript'] }

" setting default error message format
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" setting keybindings for navigating between errors
" nnoremap <silent> <c-k> <Plug>(ale_previous_wrap)
" nnoremap <silent> <c-j> <Plug>(ale_next_wrap)
" nnoremap <F6> <Plug>(ale_fix)

" }}}
" SirVer/ultisnips {{{
" https://github.com/SirVer/ultisnips

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'

" }}}
" mlaursen/vim-react-snippets {{{
" https://github.com/mlaursen/vim-react-snippets

" }}}
" Shougo/deoplete.nvim {{{
" https://github.com/Shougo/deoplete.nvim

let g:deoplete#enable_at_startup = 1
let g:deoplete#custom#option = {
      \ 'auto_complete': v:false,
      \ 'smart_case': v:true,
      \ 'camel_case': v:true,
      \ 'ignore_case': v:true,
      \ 'refresh_always': v:true }
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#custom#var = get(g:,'deoplete#omni#input_patterns', {})

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction

" call g:deoplete#custom#option('candidate_marks', ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'])

" inoremap <expr>0 pumvisible() ? deoplete#insert_candidate(0) : '0'
" inoremap <expr>1 pumvisible() ? deoplete#insert_candidate(1) : '1'
" inoremap <expr>2 pumvisible() ? deoplete#insert_candidate(2) : '2'
" inoremap <expr>3 pumvisible() ? deoplete#insert_candidate(3) : '3'
" inoremap <expr>4 pumvisible() ? deoplete#insert_candidate(4) : '4'
" inoremap <expr>5 pumvisible() ? deoplete#insert_candidate(5) : '5'
" inoremap <expr>6 pumvisible() ? deoplete#insert_candidate(6) : '6'
" inoremap <expr>7 pumvisible() ? deoplete#insert_candidate(7) : '7'
" inoremap <expr>8 pumvisible() ? deoplete#insert_candidate(8) : '8'
" inoremap <expr>9 pumvisible() ? deoplete#insert_candidate(9) : '9'

" }}}
" ternjs/tern_for_vim {{{
" https://github.com/ternjs/tern_for_vim

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
" let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" }}}
" carlitux/deoplete-ternjs {{{
" https://github.com/carlitux/deoplete-ternjs

" }}}

" }}}
" searching code & files {{{

" airblade/vim-rooter {{{
" https://github.com/airblade/vim-rooter

" }}}
" junegunn/fzf {{{
" https://github.com/junegunn/fzf

" define in-fzf keybindings
let g:fzf_action = {
  \ 'ctrl-x': 'tab split',
  \ 'ctrl-c': 'split',
  \ 'ctrl-v': 'vsplit'
  \ }

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

let $FZF_DEFAULT_COMMAND = 'ag --hidden --smart-case -l -g ""'

" git based FZF
nnoremap <leader>fg :GFiles<cr>

" default FZF
nnoremap <leader>fz :FZF<cr>

" search through open buffers
nnoremap <leader>fb :Buffers<cr>

" search through buffers history
nnoremap <leader>fh :History<cr>

" search for tags across project
nnoremap <leader>ft :Tags<cr>

" search for tags in current buffer
nnoremap <leader>FT :BTags<cr>

" ag for word under cursor
vnoremap <leader>FA y:Ag <c-r><cr>:cw<cr>
nnoremap <leader>FA :Ag <c-r><c-w><cr>
" nnoremap K *N:grep! "\b<c-r><c-w>\b"<cr>:cw<cr>

" }}}
" ludovicchabant/vim-gutentags {{{
" https://github.com/ludovicchabant/vim-gutentags

let g:gutentags_file_list_command = "rg --files --follow --hidden -g '!.git'"

" uncomment for extra debugging, viewable via :messages
" let g:gutentags_trace = 1

" }}}
" justinmk/vim-sneak {{{
" https://github.com/justinmk/vim-sneak

let g:sneak#label = 1

" }}}
" mileszs/ack.vim {{{
" https://github.com/mileszs/ack.vim

" Use the the_silver_searcher if possible (much faster than Ack)
if executable('ag')
  let g:ackprg = 'ag --hidden --vimgrep --smart-case'
  set grepprg=ag\ --hidden\ --vimgrep\ --smart-case
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Open Ack and put the cursor in the right position
nnoremap <leader>fa :Ack<space>

" When you search with Ack, display your results in cope by doing:
nnoremap <leader>cc :botright cope<cr>

" To go to the next search result do:
nnoremap <leader>o :cn<cr>

" To go to the previous search results do:
nnoremap <leader>i :cp<cr>

" }}}
" rbgrouleff/bclose.vim {{{
" https://github.com/rbgrouleff/bclose.vim

" }}}
" francoiscabrol/ranger.vim {{{
" https://github.com/francoiscabrol/ranger.vim

let g:ranger_map_keys = 0

" }}}

" }}}
" productivity {{{

" vimwiki/vimwiki {{{
" https://github.com/vimwiki/vimwiki

let g:vimwiki_list = [{'path': '~/refs/', 'syntax': 'markdown', 'ext': '.mkdn'}]
let g:vimwiki_diary_months = {
  \ 1: 'January', 2: 'February', 3: 'March', 4: 'April', 5: 'May',
  \ 6: 'June', 7: 'July', 8: 'August', 9: 'September', 10: 'October',
  \ 11: 'November', 12: 'December' }

autocmd FileType vimwiki nnoremap <leader>wi :VimwikiUISelect<cr>
autocmd FileType vimwiki nnoremap <leader>wv :VimwikiSplitLink<cr>
autocmd FileType vimwiki nnoremap <leader>ws :VimwikiVSplitLink<cr>

" }}}
" freitass/todo.txt-vim {{{
" https://github.com/freitass/todo.txt-vim

" }}}
" wakatime/vim-wakatime {{{
" https://github.com/wakatime/vim-wakatime

" }}}

" }}}
" utils {{{

" liuchengxu/vim-which-key {{{
" https://github.com/liuchengxu/vim-which-key

let g:mapleader = "\<space>"
let g:maplocalleader = "\\"

" vim-which-key
nnoremap <silent> <leader> :WhichKey "\<space>"<cr>
nnoremap <silent> <localleader> :WhichKey "\\"<cr>

" }}}
" tpope/vim-surround {{{
" https://github.com/tpope/vim-surround

" }}}
" tpope/vim-commentary {{{
" https://github.com/tpope/vim-commentary

" }}}
" tpope/vim-repeat {{{
" https://github.com/tpope/vim-repeat

" }}}
" iamcco/markdown-preview.nvim {{{
" https://github.com/iamcco/markdown-preview.nvim

" example
" nmap <C-s> <Plug>MarkdownPreview
" nmap <M-s> <Plug>MarkdownPreviewStop
" nmap <C-p> <Plug>MarkdownPreviewToggle

" }}}
" wellle/targets.vim {{{
" https://github.com/wellle/targets.vim

" }}}
" dbmrq/vim-ditto {{{
" https://github.com/dbmrq/vim-ditto

" turn on ditto's autocmds
autocmd FileType markdown,text,tex DittoOn

" vim-ditto
nnoremap <leader>di <Plug>ToggleDitto

" }}}
" tpope/vim-obsession {{{
" https://github.com/tpope/vim-obsession

nnoremap <leader><leader>o :Obsess<cr>

" }}}
" skywind3000/asyncrun.vim {{{
" https://github.com/skywind3000/asyncrun.vim

" }}}
" airblade/vim-gitgutter {{{
" https://github.com/airblade/vim-gitgutter

" }}}
" tpope/vim-fugitive {{{
" https://github.com/tpope/vim-fugitive

" }}}

" }}}
" aesthetics {{{

" gruvbox-community/gruvbox {{{
" https://github.com/gruvbox-community/gruvbox

if (has("termguicolors"))
  set termguicolors
endif
set background=light
let g:gruvbox_contrast_light = 'hard'
colorscheme gruvbox

" }}}
" junegunn/goyo.vim {{{
" https://github.com/junegunn/goyo.vim

let g:goyo_width = 95
let g:goyo_height = 85
let g:goyo_linenr = 0

" toggle limelight alongside goyo
augroup goyoCustom
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
augroup END

" ensure `:q` quits even when Goyo is active
function! s:goyo_enter()
  set nonu nornu
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  set number relativenumber

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

" toggle goyo
nnoremap <silent> <leader><leader>r :<c-u>Goyo<cr>

" }}}
" junegunn/limelight.vim {{{
" https://github.com/junegunn/limelight.vim

" toggle limelight
nnoremap <silent> <leader><leader>f :<c-u>Limelight!!<cr>

" }}}
" sainnhe/artify.vim {{{
" https://github.com/sainnhe/artify.vim

" }}}
" itchyny/lightline.vim {{{
" https://github.com/itchyny/lightline.vim

" functions {{{
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
function! GitStatus() " {{{
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
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
function! Artify_gitstatus() abort " {{{
  if gitbranch#name() !=# ''
    return Artify(GitStatus(), 'monospace')
  else
    return "xxx"
  endif
endfunction " }}}
 " }}}
" settings {{{
set laststatus=2  " Basic
set noshowmode  " Disable show mode info
let g:lightline = { 'colorscheme': "gruvbox" }
let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
let g:lightline.subseparator = { 'left': "\ue621", 'right': "\ue621" }
let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
let g:lightline.tabline_subseparator = { 'left': "\ue621", 'right': "\ue621" }
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf529"
let g:lightline#ale#indicator_errors = "\uf00d"
let g:lightline#ale#indicator_ok = "\uf00c"
let g:lightline#asyncrun#indicator_none = ''
let g:lightline#asyncrun#indicator_run = 'Running...'
let g:lightline.active = {
      \ 'left': [
        \ [ 'artify_mode', 'paste' ],
        \ [ 'readonly', 'filename', 'modified', 'devicons_filetype' ]],
      \ 'right': [
        \ [ 'artify_lineinfo' ],
        \ [ 'linter_checking', 'linter_errors',
          \ 'linter_warnings', 'linter_ok', 'vim-obsession' ],
        \ [ 'asyncrun_status' ]] }
let g:lightline.inactive = {
      \ 'left': [[ 'filename' , 'modified', 'devicons_filetype' ]],
      \ 'right': [[ 'artify_lineinfo' ]] }
let g:lightline.tabline = {
      \ 'left': [[ 'vim_logo', 'tabs' ]],
      \ 'right': [[ 'artify_gitstatus', 'artify_gitbranch' ]] }
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
      \ 'tabnum': 'Tab_num' }
let g:lightline.component = {
      \ 'absolutepath': '%F',
      \ 'artify_gitbranch' : '%{Artify_gitbranch()}',
      \ 'artify_gitstatus' : '%{Artify_gitstatus()}',
      \ 'artify_lineinfo': "%2{Artify_line_percent()}\uf295 \ue0a1%3{Artify_line_num()}:%-2{Artify_col_num()}",
      \ 'artify_mode': '%{Artify_lightline_mode()}',
      \ 'bufinfo': '%{bufname("%")}:%{bufnr("%")}',
      \ 'bufnum': '%n',
      \ 'charvalue': '%b',
      \ 'charvaluehex': '%B',
      \ 'column': '%c',
      \ 'close': '%999X X ',
      \ 'filename': '%t',
      \ 'filesize': "%{HumanSize(line2byte('$') + len(getline('$')))}",
      \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
      \ 'lineinfo': '%2p%% %3l:%-2v',
      \ 'line': '%l',
      \ 'mode': '%{lightline#mode()}',
      \ 'modified': '%M',
      \ 'paste': '%{&paste?"PASTE":""}',
      \ 'percent': '%2p%%',
      \ 'percentwin': '%P',
      \ 'readonly': '%R',
      \ 'relativepath': '%f',
      \ 'spell': '%{&spell?&spelllang:""}',
      \ 'vim_logo': "\ue7c5",
      \ 'vim-obsession': '%{ObsessionStatus()}',
      \ 'winnr': '%{winnr()}' }
let g:lightline.component_function = {
      \ 'devicons_filetype': 'Devicons_Filetype',
      \ 'gitbranch': 'Gitbranch',
      \ 'gitstatus': 'GitStatus' }
let g:lightline.component_expand = {
      \ 'asyncrun_status': 'lightline#asyncrun#status',
      \ 'linter_checking': 'lightline#ale#checking',
      \ 'linter_errors': 'lightline#ale#errors',
      \ 'linter_ok': 'lightline#ale#ok',
      \ 'linter_warnings': 'lightline#ale#warnings' }
let g:lightline.component_type = {
      \ 'linter_errors': 'error',
      \ 'linter_warnings': 'warning' }
" }}}
" }}}
" itchyny/vim-gitbranch {{{
" https://github.com/itchyny/vim-gitbranch

" }}}
" maximbaz/lightline-ale {{{
" https://github.com/maximbaz/lightline-ale

" }}}
" albertomontesg/lightline-asyncrun {{{
" https://github.com/albertomontesg/lightline-asyncrun

" }}}
" sainnhe/tmuxline.vim {{{
" https://github.com/sainnhe/tmuxline.vim

" }}}
" ryanoasis/vim-devicons {{{
" https://github.com/ryanoasis/vim-devicons

" }}}

" }}}
