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
export GOROOT=/usr/local/opt/go/libexec

export PATH="$HOME/.cargo/bin:$PATH"

export FLUTTERDIR=$GITHUB/flutter/flutter
export PATH=$FLUTTERDIR/bin:$FLUTTERDIR/.pub-cache/bin:$FLUTTERDIR/bin/cache/dart-sdk/bin:$PATH

export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=/usr/local/lib/ruby/gems/2.7.0/bin:$PATH

export PATH=$GITHUB/istio-1.6.0/bin:$PATH
export PATH=$HOME/.wasme/bin:$PATH

export DOCKER_BUILDKIT=1
export CLOUDSDK_PYTHON=python3.8

export LESSCHARSET=utf-8

export BAT_DEFAULT_OPTS='--plain --theme ansi-dark --color always'

export GIT_PAGER="bat $BAT_DEFAULT_OPTS"

alias ls='exa'
alias cat="bat $BAT_DEFAULT_OPTS"
alias grep='rg'
alias tomocy='cd $TOMOCY'
alias github='cd $GITHUB'
alias notify='terminal-notifier -message Completed! -sound default'

[ -f $HOME/.config/zsh/fzf.zsh ] && source $HOME/.config/zsh/fzf.zsh

source <(kubectl completion zsh)

eval "$(starship init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tomocy/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tomocy/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tomocy/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tomocy/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ -o interactive ]]; then
  exec fish
fi
