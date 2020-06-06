" overflow.vim file
" created by Nick Garcia
" https://github.com/NicksIdeaEngine/dotfiles

" This file is a temporary holder file for vimrc related ideas I want to review
" and possibly use in my setup. This file isn't called by init.vim

" plugin ideas {{{

" markdown open preview
" image viewing
" echodoc
" cope

" Git
" https://github.com/tpope/vim-fugitive
" https://github.com/mhinz/vim-signify

" rust {{{
" could be used for autocompiling rust, but needs a weird hack from
" https://seenaburns.com/vim-setup-for-rust/ to work
" https://github.com/neomake/neomake
" here's the hack:
" " Neomake
" Gross hack to stop Neomake running when exitting because it creates a zombie cargo check process which holds the lock and never exits. But then, if you only have QuitPre, closing one pane will disable neomake, so BufEnter reenables when you enter another buffer.
" let s:quitting = 0
" au QuitPre *.rs let s:quitting = 1
" au BufEnter *.rs let s:quitting = 0
" au BufWritePost *.rs if ! s:quitting | Neomake | else | echom "Neomake disabled"| endif
" let g:neomake_warning_sign = {'text': '?'}

" potentially use rusty-tags for ctags, or ~/.ctags file?
" https://github.com/dan-t/rusty-tags

" cargo watch
" https://github.com/passcod/cargo-watch

" }}}
" vim-multiple-cursors {{{
" let g:multi_cursor_use_default_mapping=0

" Default mapping
" let g:multi_cursor_start_word_key      = '<C-s>'
" let g:multi_cursor_select_all_word_key = '<A-s>'
" let g:multi_cursor_start_key           = 'g<C-s>'
" let g:multi_cursor_select_all_key      = 'g<A-s>'
" let g:multi_cursor_next_key            = '<C-s>'
" let g:multi_cursor_prev_key            = '<C-p>'
" let g:multi_cursor_skip_key            = '<C-x>'
" let g:multi_cursor_quit_key            = '<Esc>'
" }}}

" }}}
" keymap ideas {{{

" better tab management
" map <leader>tn :tabnew<cr>
" map <leader>to :tabonly<cr>
" map <leader>tc :tabclose<cr>
" map <leader>tm :tabmove
" map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
" let g:lasttab = 1
" nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
" au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
" map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Specify the behavior when switching between buffers
" try
"   set switchbuf=useopen,usetab,newtab
"   set stal=2
" catch
" endtry

" Return to last edit position when opening files (You want this!)
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Pressing ,ss will toggle and untoggle spell checking
" map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
" map <leader>sn ]s
" map <leader>sp [s
" map <leader>sa zg
" map <leader>s? z=

" surround visual selection in symbol
" vnoremap $1 <esc>`>a)<esc>`<i(<esc>
" vnoremap $2 <esc>`>a]<esc>`<i[<esc>
" vnoremap $3 <esc>`>a}<esc>`<i{<esc>
" vnoremap $$ <esc>`>a"<esc>`<i"<esc>
" vnoremap $q <esc>`>a'<esc>`<i'<esc>
" vnoremap $e <esc>`>a`<esc>`<i`<esc>

" Map auto complete of (, ", ', [
" inoremap $1 ()<esc>i
" inoremap $2 []<esc>i
" inoremap $3 {}<esc>i
" inoremap $4 {<esc>o}<esc>O
" inoremap $q ''<esc>i
" inoremap $e ""<esc>i

" iab xdate <C-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

" search for current selection
" vnoremap <silent> * :call VisualSelection('f')<cr>
" vnoremap <silent> # :call VisualSelection('b')<cr>

" search and replace selected text
" vnoremap <silent> <leader>r :call VisualSelection('replace')<cr>

" potential use with ale/tern completion?
" inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
" inoremap <tab> <c-n>
" inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<cr>"

" Toggle line numbers
" nnoremap <leader>N :setlocal number!<cr>

" Speed up scrolling of the viewport slightly
" nnoremap <C-e> 4<C-e>
" nnoremap <C-y> 4<C-y>

" Sort paragraphs
" vnoremap <leader>s !sort -f<CR>gv
" nnoremap <leader>s vip!sort -f<CR><Esc>

" make p in Visual mode replace the selected text with the yank register
" vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
" nnoremap ' `
" nnoremap ` '

" Use shift-H and shift-L for move to beginning/end
" nnoremap H 0
" nnoremap L $
" vnoremap K 5<up>
" vnoremap J 5<down>
" vnoremap H 0
" vnoremap L $

" Split previously opened file ('#') in a split window
" nnoremap <leader>sh :execute "leftabove vsplit" bufname('#')<cr>
" nnoremap <leader>sl :execute "rightbelow vsplit" bufname('#')<cr>

" move easily while in insert mode
" imap <A-h> <left>
" imap <A-j> <down>
" imap <A-k> <up>
" imap <A-l> <right>
" inoremap <A-H> <ESC>I
" inoremap <A-J> <down><down><down><down><down>
" inoremap <A-K> <up><up><up><up><up>
" inoremap <A-L> <ESC>A

" }}}
" function ideas {{{

" windows like clipboard

" yank to and paste from the clipboard without prepending "* to commands
" let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'

" map c-x and c-v to work as they do in windows, only in insert mode
" vm <c-x> "+x
" vm <c-c> "+y
" cno <c-v> <c-r>+
" exe 'ino <script> <c-V>' paste#paste_cmd['i']

" autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack searching and cope displaying
"    requires ack.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use the the_silver_searcher if possible (much faster than Ack)
" if executable('ag')
"   let g:ackprg = 'ag --vimgrep --smart-case'
" endif

" When you press gv you Ack after the selected text
" vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
" map <leader>g :Ack

" When you press <leader>r you can search and replace the selected text
" vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!

" When you search with Ack, display your results in cope by doing:
"   <leader>cc

" To go to the next search result do:
"   <leader>n

" To go to the previous search results do:
"   <leader>p

" map <leader>cc :botright cope<cr>
" map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
" map <leader>n :cn<cr>
" map <leader>p :cp<cr>

" Make sure that enter is never overriden in the quickfix window
" autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
" au FileType javascript call JavaScriptFold()
" au FileType javascript setl fen
" au FileType javascript setl nocindent

" au FileType javascript imap <C-t> $log();<esc>hi
" au FileType javascript imap <C-a> alert();<esc>hi

" au FileType javascript inoremap <buffer> $r return
" au FileType javascript inoremap <buffer> $f // --- PH<esc>FP2xi

" function! JavaScriptFold()
"   setl foldmethod=syntax
"   setl foldlevelstart=1
"   syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

"   function! FoldText()
"     return substitute(getline(v:foldstart), '{.*', '{...}', '')
"   endfunction
"   setl foldtext=FoldText()
" endfunction

" " ripgrep
" if executable("rg")
"   set grepprg=rg\ --vimgrep\ --no-heading
"   set grepformat=%f:%l:%c:%m,%f:%l:%m
" endif

" Use The Silver Searcher over grep, iff possible
" if executable('ag')
"    " Use ag over grep
"    set grepprg=ag\ --nogroup\ --nocolor
" endif

" grep/Ack/Ag for the word under cursor
" vnoremap <leader>a y:grep! "\b<c-r>"\b"<cr>:cw<cr>
" nnoremap <leader>a :grep! "\b<c-r><c-w>\b"
" vnoremap <leader>a y:Ag <c-r><cr>:cw<cr>
" nnoremap <leader>a :Ag <c-r><c-w>
" nnoremap K *N:grep! "\b<c-r><c-w>\b"<cr>:cw<cr>

" }}}
" archives {{{
" polyglot alternatives {{{

" all of these are what polyglot replaces (regarding frontend web dev)

" https://github.com/othree/html5.vim
" Plug 'othree/html5.vim'

" https://github.com/hail2u/vim-css3-syntax
" Plug 'hail2u/vim-css3-syntax'

" https://github.com/cakebaker/scss-syntax.vim
" Plug 'cakebaker/scss-syntax.vim'

" https://github.com/pangloss/vim-javascript
" Plug 'pangloss/vim-javascript'

" https://github.com/MaxMEllon/vim-jsx-pretty
" Plug 'maxmellon/vim-jsx-pretty', { 'as': 'vim-syntax-jsx', 'for': [ 'javascriptreact' ] }

" https://github.com/HerringtonDarkholme/yats.vim (for typescript)
" Plug 'HerringtonDarkholme/yats.vim'

" https://github.com/elzr/vim-json
" Plug 'elzr/vim-json'

" https://github.com/jparise/vim-graphql
" Plug 'jparise/vim-graphql'

" https://github.com/plasticboy/vim-markdown
" Plug 'plasticboy/vim-markdown'

" https://github.com/jxnblk/vim-mdx-js
" Plug 'jxnblk/vim-mdx-js'

" https://github.com/vim-python/python-syntax
" Plug 'vim-python/python-syntax'

" https://github.com/Vimjas/vim-python-pep8-indent
" Plug 'Vimjas/vim-python-pep8-indent'

" https://github.com/aliev/vim-compiler-python
" Plug 'aliev/vim-compiler-python'

" https://github.com/mboughaba/i3config.vim
" Plug 'mboughaba/i3config.vim'

" https://github.com/ericpruitt/tmux.vim
" Plug 'ericpruitt/tmux.vim'

" https://github.com/arzg/vim-sh
" Plug 'arzg/vim-sh'

" https://github.com/vim-ruby/vim-ruby
" Plug 'vim-ruby/vim-ruby'

" https://github.com/rust-lang/rust.vim
" Plug 'rust-lang/rust.vim'

" }}}
" neoclide/coc.nvim {{{
" https://github.com/neoclide/coc.nvim

" let g:coc_global_extensions=[]

" nmap <leader><leader>c <Plug>(coc-codeaction)

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1] =~# '\s'
" endfunction

" inoremap <silent><expr> <tab>
"   \ pumvisible() ? "\<c-n>" :
"   \ <SID>check_back_space() ? "\<tab>" :
"   \ coc#refresh()

" use <tab> and <s-tab> to navigate completion list
" inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
" inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" use <cr> to confirm completion
" inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"

" make <cr> select first item and confirm if no item is selcted
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<c-g>u\<cr>"

" close preview window when completion is done
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" let g:coc_snippet_next = '<c-semicolon>'
" let g:coc_snippet_prev = '<m-semicolon>'

" use <c-space> to trigger completion
" inoremap <silent><expr> <c-space> coc#refresh()

" }}}
" }}}
