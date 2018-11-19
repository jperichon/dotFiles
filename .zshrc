ZSH=$HOME/.oh-my-zsh

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
alias diff='colordiff'
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
colored-man
cp
docker
docker-compose
gem
git
git-flow
heroku
history-substring-search
hub
osx
rails
rake
rake-fast
ssh
vi-mode
)

export PATH=/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/bin:/usr/local/sbin:$HOME/Projects/scripts:/usr/local/share/npm/bin
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
