#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

[[ -f ~/.aliases ]] && echo "and"

[[ ! -f ~/.aliases ]] && echo "not"

[[ -f ~/.aliases ]] || echo "maybe"

[[ ! -f ~/.aliases ]] || echo "possibly"
