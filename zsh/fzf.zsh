#!/bin/bash

export FZF_DEFAULT_OPTS="--layout=reverse \
--extended \
--cycle \
--tac \
--ansi \
--prompt='-> ' \
--bind=alt-up:preview-up,alt-down:preview-down"

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
--color fg:$COLOR_WHITE,fg+:$COLOR_GREEN \
--color bg:$COLOR_BLACK,bg+:$COLOR_BLACK \
--color hl:$COLOR_GREEN,hl+:$COLOR_GREEN \
--color pointer:$COLOR_BLUE,marker:$COLOR_GREEN,spinner:$COLOR_BLUE \
--color info:$COLOR_GREEN,prompt:$COLOR_BLUE,header:$COLOR_WHITE"

export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude .git . ."
export FZF_FIND_FILE_COMMAND="fd --hidden --follow --exclude .git . \$dir"

function fzf_find_history() {
  local result
  result=$(history -n 0 | fzf)
  BUFFER="$result"
  CURSOR=${#BUFFER}
  zle redisplay
}

function fzf_find_file() {
  local args=()
  IFS=' ' read -r -A args <<< "$BUFFER"

  local raw_arg
  raw_arg="${args[-1]}"

  local arg
  arg=$(eval printf '%s' "$raw_arg")

  local target
  local query
  if [ -z "$arg" ]; then
    target='.'
    query=''
  else
    local raw_target
    raw_target=$(echo "$arg" | grep -o '[^ ]+$')

    target="$raw_target"
    while [ ! -d "$target" ]; do
      target=$(dirname "$target")
    done

    query=${raw_target#"$target"}
    query=${query#'/'}
  fi

  local result
  result=$(eval "fd --hidden --follow --exclude .git . $target | fzf $FZF_DEFAULT_OPTS --query \"$query\"")

  if [ -z "$arg" ]; then
    BUFFER="$BUFFER$result"
  else
    BUFFER=${BUFFER/"$raw_arg"/"$result"}
  fi

  # shellcheck disable=SC2034
  CURSOR=${#BUFFER}
  zle redisplay
}

zle -N fzf_find_history
bindkey '^[r' fzf_find_history

zle -N fzf_find_file
bindkey '^[t' fzf_find_file
