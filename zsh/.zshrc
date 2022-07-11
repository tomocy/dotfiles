#!/bin/bash

autoload colors
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_no_store

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

export LESSCHARSET=utf-8

if [[ "$TERM_PROGRAM" = "Apple_Terminal" ]]; then
  export COLOR_BLACK=0
  export COLOR_GREEN=2
  export COLOR_BLUE=4
  export COLOR_WHITE=7
else
  export COLOR_BLACK="#000000"
  export COLOR_GREEN="#00ffd8"
  export COLOR_BLUE="#09e7fb"
  export COLOR_WHITE="#ffffff"
fi

export PROMPT="%c -➜ "
export PROMPT_EOL_MARK=""
eval "$(starship init zsh)"

export BAT_DEFAULT_OPTS='--plain --theme ansi-dark --color always'
BAT="bat $BAT_DEFAULT_OPTS"

export PAGER="$BAT"

export DOCKER_BUILDKIT=1

alias ls='exa'
alias grep='rg'
# shellcheck disable=SC2139
alias cat="$BAT"

# shellcheck disable=SC1091
source "$HOME/.config/zsh/fzf.zsh"
