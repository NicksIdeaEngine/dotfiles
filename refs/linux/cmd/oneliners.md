# Best Bash / Shell One Liners

## Change Owner / Group Recursively

`chown -R owner:group * .[^.]*`

## Changing File/Directory User:Group Recursively

Needed when stuff in `/mnt/sdc1/dbx/*` somehow became a mix of `efex:efex` and `root:root`. This caused problems when trying to `npm install` stuff.

- `find . -type f -exec chown efex:efex {} +`
- `find . -type d -exec chown efex:efex {} +`

## Adding lines of text to files at specific lines

`sed -i "2i <text here>" <file/glob>`

## Output Vim Mappings

From within vim:

`:redir! > map_keys.txt`
`:silent verbose map`
`:redir END`
