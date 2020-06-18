" overflow.vim file
" created by Nick Garcia
" https://github.com/NicksIdeaEngine/dotfiles

" This file is a temporary holder file for vimrc related ideas I want to review
" and possibly use in my setup. This file isn't called by init.vim

" plugin ideas {{{

" image viewing
" echodoc

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
" }}}
