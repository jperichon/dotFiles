ZSH=$HOME/.oh-my-zsh

ZSH_TMUX_AUTOSTART=true

# git aliases
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gti='git'
alias vmi='vim'
alias ivm='vim'
# custom aliases
alias pw='pwd'
alias top='htop'
alias tail='tail'
#alias diff='colordiff'
alias clr='clear'
alias cls='clear'
alias mkdir='mkdir -p'
alias v='vim'
alias g='git'
alias flushdns='dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say flushed'

export PAGER="vimpager"
export EDITOR="vim"
export SVN_EDITOR="vim"
export GIT_EDITOR="vim"
export TERM=xterm-256color
setopt INTERACTIVE_COMMENTS

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

plugins=(
autojump
aws
bower
brew
bundler
chruby
colored-man-pages
cp
docker
docker-compose
gem
git
git-flow
heroku
history-substring-search
macos
rails
rake
rake-fast
ssh-agent
tmux
vi-mode
)

export PATH=/usr/local/opt/coreutils/libexec/gnubin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/bin:/usr/local/sbin:$HOME/Projects/scripts:/usr/local/share/npm/bin
export CLICOLOR_FORCE=1
export ZSH_THEME="refined"

[[ -f `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/heroku/bin:$PATH"
# chruby ruby-2.4.0
export GOPATH=~/go
export GOROOT=/usr/local/opt/go/libexec
export GOBIN=$GOPATH/bin
export GO15VENDOREXPERIMENT=1
export PATH=$PATH:$GOBIN
export HIST_IGNORE_SPACE=1
export PATH="/usr/local/opt/node@10/bin:$PATH"

source $HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
