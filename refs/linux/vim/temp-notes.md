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
