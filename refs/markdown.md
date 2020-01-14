Originally pulled from: [https://github.com/adam-p/markdown-here/wiki/Markdown-Here-Cheatsheet](Adam P's Markdown Here Cheatsheet)

# Headers

Use between 1 - 6 "#" symbols to define headlines

# H1

## H2

### H3

#### H4

##### H5

###### H6

Alternatively, for H1 and H2, an underline-ish style:

# Alt-H1

## Alt-H2

# Emphasis

Emphasize, aka italics, with one asterisk around text ( _asterisks_ ) or one underscore ( _underscores_ )

Strong emphasis, aka bold, with double asterisks ( **asterisks** ) or double underscores ( **underscores** )

Combined emphasis with nested **asterisks and _underscores_**.

Strikethrough uses two tildes. ~~Scratch this.~~

# Lists

Use "1. " for ordered or "\* " for unordered lists. Sub-list items just need two spaces per level of nesting.

1. First ordered list item
2. Another item

- Unordered sub-list.
  1. Third level of nesting
  - Fourth level of nesting

1. Actual numbers don't matter, just that it's a number
2. Ordered sub-list. It's #2, not #7!
3. And another item.

   You can have properly indented paragraphs. Notice the blank line above, and the leading spaces.

_(dots are used to show where spaces would be, but don't use dots in your files! just spaces)_

⋅⋅⋅To have a line break without a paragraph, you will need to use two trailing spaces.⋅⋅
⋅⋅⋅Note that this line is separate, but within the same paragraph.⋅⋅
⋅⋅⋅(This is contrary to the typical GFM line break behaviour, where trailing spaces are not required.)

- Unordered list can use asterisks

* Or minuses

- Or pluses

# Links

[I'm an inline-style link](https://www.google.com)

[I'm an inline-style link with title](https://www.google.com "Google's Homepage")

[I'm a reference-style link][arbitrary case-insensitive reference text] _(this is referencing a link 14 lines below this one)_

[I'm a relative reference to a repository file](../blob/master/LICENSE)

[You can use numbers for reference-style link definitions][1] _(referencing a link 11 lines below this one)_

Or leave it empty and use the [link text itself]. _(referencing a link 10 lines below this one)_

URLs and URLs in angle brackets will automatically get turned into links.
http://www.example.com or <http://www.example.com> and sometimes
example.com (but not on Github, for example).

Some text to show that the reference links can follow later.

[arbitrary case-insensitive reference text]: https://www.mozilla.org
[1]: http://slashdot.org
[link text itself]: http://www.reddit.com

# Images

Here's our logo (hover to see the title text):

Inline-style:
![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png 'Logo Title Text 1')

Reference-style:
![alt text][logo]

[logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png 'Logo Title Text 2'

# Code and Syntax Highlighting

Inline `code` has `back-ticks around` it.

Or use three back-ticks before/after code to show large blocks of code.

```
if (isCode) {
  return "What a block of code!";
}
```

Right after the first three back-ticks you can specify syntax for highlighting purposes.

```javascript
var s = 'JavaScript syntax highlighting';
alert(s);
```

```python
s = "Python syntax highlighting"
print s
```

```
No language indicated, so no syntax highlighting.
But let's throw in a <b>tag</b>.
```

# Tables

Colons can be used to align columns.

| Tables        |      Are      |   Cool |
| ------------- | :-----------: | -----: |
| col 3 is      | right-aligned | \$1600 |
| col 2 is      |   centered    |   \$12 |
| zebra stripes |   are neat    |    \$1 |

There must be at least 3 dashes separating each header cell.
The outer pipes (|) are optional, and you don't need to make the
raw Markdown line up prettily. You can also use inline Markdown.

| Markdown | Less      | Pretty     |
| -------- | --------- | ---------- |
| _Still_  | `renders` | **nicely** |
| 1        | 2         | 3          |

# Blockquotes

> Blockquotes are very handy in email to emulate reply text.
> This line is part of the same quote.

Quote break.

> This is a very long line that will still be quoted properly when it wraps. Oh boy let's keep writing to make sure this is long enough to actually wrap for everyone. Oh, you can _put_ **Markdown** into a blockquote.

# Inline HTML

<dl>
  <dt>Definition list</dt>
  <dd>Is something people use sometimes.</dd>

  <dt>Markdown in HTML</dt>
  <dd>Does *not* work **very** well. Use HTML <em>tags</em>.</dd>
</dl>

# Horizontal Rule

Three or more...

---

Hyphens

---

Asterisks

---

Underscores

# Line Breaks

Here's a line for us to start with.

This line is separated from the one above by two newlines, so it will be a _separate paragraph_.

This line is also a separate paragraph, but...
This line is only separated by a single newline, so it's a separate line in the _same paragraph_.

# YouTube Videos

<a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ" target="_blank"><img src="http://img.youtube.com/vi/dQw4w9WgXcQ/0.jpg" alt="IMAGE ALT TEXT HERE" width="240" height="180" border="10" /></a>

[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/dQw4w9WgXcQ/0.jpg)](http://www.youtube.com/watch?v=dQw4w9WgXcQ)
