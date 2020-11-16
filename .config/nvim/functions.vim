" functions.vim file
" created by Nick Garcia
" https://github.com/NicksIdeaEngine/dotfiles

" utils {{{

" only enable relative numbers for focused, non-insert mode window
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" }}}
" file support {{{

" Make it so that if files are changed externally (ex: changing git branches)
" update the vim buffers automatically
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
      \ if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost *
      \ echohl WarningMsg
      \ | echo "File changed on disk. Buffer reloaded."
      \ | echohl None

" save on losing focus, leaving buffer, or leaving insert mode
autocmd BufLeave,FocusLost,InsertLeave * :wa

" delete trailing whitespace and newlines on save
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e

" }}}
" syntax specifics {{{

" set syntax highlighting for config files
autocmd BufNewFile,BufRead .aliases set filetype=sh
autocmd BufNewFile,BufRead config set filetype=sh
autocmd BufNewFile,BufRead *.bash* set filetype=sh
autocmd BufNewFile,BufRead *.code-workspace set filetype=json
autocmd BufNewFile,BufRead *.tern-project set filetype=json
autocmd BufNewFile,BufRead *.babelrc set filetype=json
autocmd BufNewFile,BufRead *.conf set filetype=dosini

if has("autocmd")
  augroup vim_files " {{{
    autocmd!
    " bind <f1> to show the keyword under cursor
    autocmd FileType vim noremap <buffer> <F1> <esc>:help <c-r><c-w><cr>
    autocmd FileType vim noremap! <buffer> <F1> <esc>:help <c-r><c-w><cr>
  augroup end " }}}
  augroup markdown_files " {{{
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdx,wiki} setlocal spell
    autocmd FileType markdown,markdown.mdx,vimwiki setlocal formatoptions=n1
  augroup end " }}}
  augroup css_files " {{{
    autocmd!
    " enable folding via {}, and start with them open
    autocmd FileType css,scss setlocal foldmarker={,}
    autocmd FileType css,scss setlocal foldlevelstart=99
  augroup end " }}}
  augroup javascript_files " {{{
    autocmd!
    autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
    autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
    autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
    autocmd FileType javascript setlocal listchars=trail:·,extends:#,nbsp:·
    autocmd FileType javascript setlocal foldmarker={,}
    autocmd FileType javascript setlocal foldlevelstart=99
  augroup end " }}}
  augroup python_files " {{{
    autocmd!
    " disable autowrapping, 1 tab = 4 spaces
    autocmd FileType python setlocal formatoptions-=t
    autocmd FileType python setlocal textwidth=78
    autocmd FileType python setlocal shiftwidth=4
    autocmd FileType python setlocal softtabstop=4
    autocmd FileType python setlocal tabstop=4
    autocmd FileType python setlocal fileformat=unix
    autocmd FileType python match ErrorMsg '\%>120v.\+'

    " let python_highlight_all=1

    " Python runners
    autocmd FileType python noremap <buffer> <F5> :w<cr>:!python %<cr>
    autocmd FileType python inoremap <buffer> <F5> <esc>:w<cr>:!python %<cr>
    autocmd FileType python noremap <buffer> <S-F5> :w<cr>:!ipython %<cr>
    autocmd FileType python inoremap <buffer> <S-F5> <esc>:w<cr>:!ipython %<cr>
  augroup end " }}}
  augroup rust_files " {{{
    autocmd!
    " Auto-wrap text around 74 chars
    autocmd FileType rust setlocal textwidth=74
    autocmd FileType rust setlocal foldmarker={,}
    autocmd FileType rust setlocal foldlevelstart=99
    autocmd FileType rust match ErrorMsg '\%>74v.\+'

    " auto format using cargo fmt
    autocmd BufWritePre *.rs execute ':Autoformat'

    " racer mappings
    " autocmd FileType rust nnoremap <buffer> gd         <Plug>(rust-def)
    " autocmd FileType rust nnoremap <buffer> gs         <Plug>(rust-def-split)
    " autocmd FileType rust nnoremap <buffer> gx         <Plug>(rust-def-vertical)
    " autocmd FileType rust nnoremap <buffer> gt         <Plug>(rust-def-tab)
    " autocmd FileType rust nnoremap <buffer> <leader>gd <Plug>(rust-doc)
  augroup end " }}}
endif

" }}}
" integrated terminals {{{
" pop-up, non-persistent terminal {{{

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
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on <c-n>
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction

nnoremap <c-n> :call OpenTerminal()<cr>

" }}}
" dropdown, persistent terminal {{{

nnoremap <silent> <leader>. :call nvim_open_win(bufnr('%'), v:true, {'relative': 'editor', 'anchor': 'NW', 'width': winwidth(0), 'height': 2*winheight(0)/5, 'row': 1, 'col': 0})<cr>:call TerminalToggle()<cr>
tnoremap <silent> <leader>. <c-\><c-n>:call TerminalToggle()<cr>:q<cr>

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
" }}}
