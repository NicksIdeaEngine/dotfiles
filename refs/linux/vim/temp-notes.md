# Notes from Anywhere Prior to Sorting

This is a place to put anything that doesn't yet have a definite place. It shouldn't stay long since information should get sorted into wiki.

## "My Favorite Vim Tricks" from Makc (YouTube)

[Here's the video.](https://www.youtube.com/watch?v=B-EPvfxcgl0)

- `:tabedit <file>` opens file in new tab
- `gt` and `gT` to navigate tabs
- `vim -p <file1> <file2> <file3>...` opens files in multiple tabs at once
- vim workspaces
  - `:mksession filename.vim` will save a custom file (the `.vim` is important!) in current directory that can be opened to restore session.
  - `vim -S filename.vim` restores that session
- `<C-n>` while in insert mode brings up vim's completion box
- `:Explore` opens vim's file explorer
  - `:Hex`, `:Sex`, `:Lex` are other file explorers vim has
- visual block mode: vim's version of multiple cursors
  - basic example:
    - `<C-v>` to select many lines
    - `I` to insert at beginning of line, then add "The " to first line
    - Hit `Esc` and vim will do that to all selected lines

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
- <leader>S begins the :%s///g command
- `f*` and `t*` move to or just before the next character (\*)
- `F*` and `T*` move backwards to or just after the previous character (\*)
- `;` will mimic the previous `fFtT` command
