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
- <leader>S begins the :%s///g command
- `f*` and `t*` move to or just before the next character (\*)
- `F*` and `T*` move backwards to or just after the previous character (\*)
- `;` will mimic the previous `fFtT` command

## General Notes

- ea: end of word, append
- tabs?
- `:verbose imap <c-e>` gives you info on that key binding
- `<c-o>`: back in history
- `<c-i>`: forward in history
- `<c-w>` and `=`: resize all windows based on splits
- `vi{`: visualize inside curly brackets
- `:sort` to sort selection
- `:sort u` to sort selection, leaving only unique lines
- `:-3 t .` copy line (-3) (t)o current line (.)
- `:m . -4` (m)ove current line (.) four lines up (-4)
- `:-4,-3 t .` copy lines (-4) to (-3) (t)o current line (.)
- `:buffers` to show buffers
  - 

### vim folds

- `<leader>/`: fold this section
- via (https://www.linux.com/learn/tutorials/442438-vim-tips-folding-fun)
  - `zf#j` creates a fold from the cursor down # lines.
  - `zf/string` creates a fold from the cursor to string .
  - `zj` moves the cursor to the next fold.
  - `zk` moves the cursor to the previous fold.
  - `zo` opens a fold at the cursor.
  - `zO` opens all folds at the cursor.
  - `zm` increases the foldlevel by one.
  - `zM` closes all open folds.
  - `zr` decreases the foldlevel by one.
  - `zR` decreases the foldlevel to zero -- all folds will be open.
  - `zd` deletes the fold at the cursor.
  - `zE` deletes all folds.
  - `[z` move to start of open fold.
  - `]z` move to end of open fold.

## Plugin Hotkeys

### emmet-vim

`<m-e>,` to expand abbreviation
`<m-e>,` also used to wrap selections
`<m-e>d` balance tag inward
`<m-e>D` balance tag outward
`<m-e>n` go to next edit point
`<m-e>N` go to previous edit point
`<m-e>i` update <img> size when cursor is inside img tag
`<m-e>m` merge lines
`<m-e>k` remove nearest surrounding tags
`<m-e>j` split/join nearest surrounding tags
`<m-e>/` toggle comment of nearest surrounding tags
`<m-e>a` make anchor from URL
`<m-e>A` make quoted text from a URL

### vim-surround

- `cs"'` changes `"Hello world!"` to `'Hello world!'`
- `cs'<q>` to change to `<q>Hello world!</q>`
- `cst"` to go back around to `"Hello world!"`
- `ds"` to remove delimiters
- `ysiw]` to wrap word in `[]`
- `cs]{` to `change surrounding [] to { }` (`{` adds space, `}` does not)
- `yssb` or `yss)` to yank surround sentence with parentheses
- `ds{ds)` changes `({ Hello } world!)` to `Hello world!`
- `ysiw<em>` wraps word in emphasis tags
- `VS<p class="important">` enters visual line mode, surrounds with `<p>` tags

### vim-commentary

_gcc_ in normal mode changes line to comment
_gc_ in visual mode changes selected lines to comment

### vim-obsession

- `:Obsess` with optional file/directory name to start recording a session
- `:Obsess!` to stop and throw it away.
- Load session with `vim -S` or `:source` it

### todo.txt-vim

Sorting tasks:

- `<localleader>s` Sort the file
- `<localleader>s+` Sort the file on +Projects
- `<localleader>s@` Sort the file on @Contexts
- `<localleader>sd` Sort the file on dates
- `<localleader>sdd` Sort the file on due dates

Edit priority:

- `<localleader>j` Decrease the priority of the current line
- `<localleader>k` Increase the priority of the current line
- `<localleader>a` Add the priority (A) to the current line
- `<localleader>b` Add the priority (B) to the current line
- `<localleader>c` Add the priority (C) to the current line

Date:

- `<localleader>d` Set current task's creation date to the current date
- `date<tab>` (Insert mode) Insert the current date

Mark as done:

- `<localleader>x` Mark current task as done
- `<localleader>X` Mark all tasks as done
- `<localleader>D` Move completed tasks to done.txt

### goyo.vim

- `:Goyo` toggle goyo
- `:Goyo [dimension]` turn on or resize goyo
- `:Goyo!` turn off goyo
- `<leader><leader>f` focus mode (just limelight)
- `<leader><leader>r` reading mode (goyo and limelight)

### targets.vim

- `cin)` change in next parentheses
- `da,` to delete item in comma separated list under cursor
- `2i)` selects within 2nd tier of surrounding parentheses
- `2a)` selects around 2nd tier of surrounding parentheses
- `2I)` selects contents within 2nd tier of surrounding parentheses
- `2A)` selects around 2nd tier of surrounding parentheses plus whitespace on one side
- [cheatsheet](https://github.com/wellle/targets.vim/blob/master/cheatsheet.md)

### nerdtree

- <Leader>n toggles NERDTree

### vim-prettier

<Leader>p to format

## Notes from How to Configure Vim like VSCode video by Ben Awad

[Link to Dot Files](https://gist.github.com/benawad/b768f5a5bbd92c8baabd363b7e79786f)
