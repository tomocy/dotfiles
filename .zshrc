PROMPT="%c -➜ "
PROMPT_EOL_MARK=""

autoload -U compinit
compinit -u
autoload colors
zstyle ':completion:*' verbose yes
setopt hist_ignore_dups

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

export CODES=$HOME/Codes
export GITHUB=$CODES/src/github.com
export TOMOCY=$GITHUB/tomocy

export GO111MODULE=on
export GOPATH=$CODES
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH
export GODIR=$CODES/src/go.googlesource.com/go
export GOHEAD=$GODIR/bin/go

export FLUTTERDIR=$GITHUB/flutter/flutter
export PATH=$FLUTTERDIR/bin:$FLUTTERDIR/.pub-cache/bin:$FLUTTERDIR/bin/cache/dart-sdk/bin:$PATH

export PATH=$GITHUB/istio-1.6.0/bin:$PATH
export PATH=$HOME/.wasme/bin:$PATH

export DOCKER_BUILDKIT=1

alias ls='exa'
alias cat='bat --plain --theme ansi-dark'
alias tomocy='cd $TOMOCY'
alias github='cd $GITHUB'
alias notify='terminal-notifier -message Completed! -sound default'

[ -f $TOMOCY/zsh-fzf/fzf.zsh ] && source $TOMOCY/zsh-fzf/fzf.zsh

source <(kubectl completion zsh)

eval "$(starship init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tomocy/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tomocy/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tomocy/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tomocy/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
