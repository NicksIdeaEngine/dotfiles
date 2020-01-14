# Notes from Luke Smith's "After Vimtutor" Video

* gk and gj: move **visual** line up/down instead of logical lines
* <F5> now sources init.vim
* <F6> calls spellcheck
* d$ and D will cut to end of line (leaves you in normal mode)
* c$ and C will replace to end of line (leaving you in insert mode)
* i: inner. so *ciw* is "change inner word" for replacing a word even if you're not at the beginning of it
* a: around. so *daw* is "delete around word" which removes extra spacing around a word, but not punctuation
* using s with d and c: s can mean sentence, so *das* is "delete around sentence"
* using p with d and c: p can mean paragraph, so *dap* is "delete around paragraph"
* dot command is versatile. If I *ciw* to change a word, than search for more uses of that word, I can use *n* *dot command* *n* *dot command* and so on to cycle through search results and repeat the same replacement
* S begins the :%s///g command
* 

# Plugin Hotkeys

## vim-surround
*cs"'* changes "Hello world!" to 'Hello world!'

## vim-commentary
*gcc* in normal mode changes line to comment
*gc* in visual mode changes selected lines to comment

## nerdtree
* <Leader>n toggles NERDTree

## vim-prettier
<Leader>p to format

## emmet-vim
<c-y>, to expand abbreviation
<c-y>, also used to wrap selections
<c-y>d balance tag inward
<c-y>D balance tag outward
<c-y>n go to next edit point
<c-y>N go to previous edit point
<c-y>i update <img> size when cursor is inside img tag
<c-y>m merge lines
<c-y>k remove nearest surrounding tags
<c-y>j split/join nearest surrounding tags
<c-y>/ toggle comment of nearest surrounding tags
<c-y>a make anchor from URL
<c-y>A make quoted text from a URL

