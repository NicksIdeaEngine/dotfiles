#!/bin/bash

[[ -f ~/.aliases ]] && echo "and"

[[ ! -f ~/.aliases ]] && echo "not"

[[ -f ~/.aliases ]] || echo "maybe"

[[ ! -f ~/.aliases ]] || echo "possibly"
