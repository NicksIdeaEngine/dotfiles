# vim ref

## Notes from Luke Smith's "After Vimtutor" Video

- gk and gj: move **visual** line up/down instead of logical lines
- <F5> now sources init.vim
- <F6> calls spellcheck
- d\$ and D will cut to end of line (leaves you in normal mode)
- c\$ and C will replace to end of line (leaving you in insert mode)
- i: inner. so _ciw_ is "change inner word" for replacing a word even if you're not at the beginning of it
- a: around. so _daw_ is "delete around word" which removes extra spacing around a word, but not punctuation
- using s with d and c: s can mean sentence, so _das_ is "delete around sentence"
- using p with d and c: p can mean paragraph, so _dap_ is "delete around paragraph"
- dot command is versatile. If I _ciw_ to change a word, than search for more uses of that word, I can use _n_ _dot command_ _n_ _dot command_ and so on to cycle through search results and repeat the same replacement
- S begins the :%s///g command

## General Notes

- ea: end of word, append
- tabs?

### [vim](vim/summary.md) folds

- `<leader>/`: fold this section

## Plugin Hotkeys

### vim-surround

_cs"'_ changes "Hello world!" to 'Hello world!'

### vim-commentary

_gcc_ in normal mode changes line to comment
_gc_ in visual mode changes selected lines to comment

### nerdtree

- <Leader>n toggles NERDTree

### vim-prettier

<Leader>p to format

### emmet-vim

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

## Notes from How to Configure Vim like VSCode video by Ben Awad

[Link to Dot Files](https://gist.github.com/benawad/b768f5a5bbd92c8baabd363b7e79786f)
