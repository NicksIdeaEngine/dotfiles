# vim ref

## General Notes

- ea: end of word, append
- tabs?
- `:verbose imap <c-e>` gives you info on that key binding
- `<c-o>`: back in history
- `<c-i>`: forward in history
- `vi{`: visualize inside curly brackets
- `:sort` to sort selection
- `:sort u` to sort selection, leaving only unique lines
- `:-3 t .` copy line (-3) (t)o current line (.)
- `:m . -4` (m)ove current line (.) four lines up (-4)
- `:-4,-3 t .` copy lines (-4) to (-3) (t)o current line (.)
- `:buffers` to show buffers
  - `<leader>q` show previous buffer (`:bp<cr>`)
  - `<leader>w` show next buffer (`:bn<cr>`)
- `<m-z>` opens persistant terminal dropdown
- `<leader>s` `:%s///g<left><left><left>`
- `<leader>ev` edit `init.vim`
- `<leader>sv` reload `init.vim`
- `<leader>cd` to set directory to working directory of current file
- `<leader>=` to autoalign all windows
- `Y` for `y$` like `D` and `C`
- `<leader>a` to select all
- `<leader><leader>s` to sort css properties
- `*` or `#` to search for current visual selection
- `<leader>r` to search and replace selected text
- `gV` to highlight last inserted text
- `m` and char to mark parts of project, `\`` and char to move to marker
- `<leader>S` split to the side
- `<leader>V` split down vertically

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

### vim-prettier

<Leader>p to format

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
- surround visual selection in symbol
  - `$1` for ()
  - `$2` for []
  - `$3` for {}
  - `$$` for ""
  - `$q` for ''
  - `$e` for ``

### ultisnips

- `<tab>`: expands snippet
- `<c-b>`: jumps to next placeholder
- `<c-z>`: jumps to previous placeholder

### vim-commentary

_gcc_ in normal mode changes line to comment
_gc_ in visual mode changes selected lines to comment

### vim-obsession

- `:Obsess` with optional file/directory name to start recording a session
- `:Obsess!` to stop and throw it away.
- Load session with `vim -S` or `:source` it

### nerdtree

- <Leader>n toggles NERDTree

### markdown-preview

still need to configure this!

- nmap <C-s> <Plug>MarkdownPreview
- nmap <M-s> <Plug>MarkdownPreviewStop
- nmap <C-p> <Plug>MarkdownPreviewToggle

### goyo.vim

- `:Goyo` toggle goyo
- `:Goyo [dimension]` turn on or resize goyo
- `:Goyo!` turn off goyo
- `<leader><leader>f` focus mode (just limelight)
- `<leader><leader>r` reading mode (goyo and limelight)

### fzf

- `<leader>f` to open FZF
- `<c-t>` open in new tab
- `<c-c>` open in split
- `<c-v>` open in vsplit

### coc

- `<leader>;` to highlight next completion option while in insert mode
- `<c-n>` also higlights _next_ option, goes down in list
- `<c-p>` forces completion to appear, also highlights _previous_ option
- `<leader>gd` go to definition (targeted by cursor)
- `<leader>gr` go to references (targeted by cursor)
- `<c-p>` open git-based FZF

### ranger

- `<leader>l` :Ranger<cr>
- `<leader>L` :RangerNewTab<cr>

### vim-ditto

- `<leader>di` turn ditto on and off (word repetition)

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

### targets.vim

- `cin)` change in next parentheses
- `da,` to delete item in comma separated list under cursor
- `2i)` selects within 2nd tier of surrounding parentheses
- `2a)` selects around 2nd tier of surrounding parentheses
- `2I)` selects contents within 2nd tier of surrounding parentheses
- `2A)` selects around 2nd tier of surrounding parentheses plus whitespace on one side
- [cheatsheet](https://github.com/wellle/targets.vim/blob/master/cheatsheet.md)

## Notes from How to Configure Vim like VSCode video by Ben Awad

[Link to Dot Files](https://gist.github.com/benawad/b768f5a5bbd92c8baabd363b7e79786f)
