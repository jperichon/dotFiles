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
alias svn='colorsvn'
alias svnu='colorsvn update'
alias top='htop'
alias tail='tail'
alias diff='colordiff'
alias clr='clear'
alias cls='clear'
alias mkdir='mkdir -p'
alias v='vim'
alias tomcat='catalina'
alias youtube-dl-mp3='youtube-dl -t --extract-audio --audio-format=mp3'
alias flushdns='dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say flushed'
alias emp-staging='EMPIRE_API_URL=https://empire.checkr-staging.com/ emp'

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
capistrano
chruby
colored-man
cp
docker
docker-compose
extract
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
tmuxinator
vi-mode
)

# export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/r20.0.3
# export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/bin:/usr/local/sbin:$HOME/Projects/scripts:/usr/local/share/npm/bin
export CLICOLOR_FORCE=1
export ZSH_THEME="pure"
export EMPIRE_API_URL=https://empire.checkr.com/

[[ -f `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

function fname() { find . -iname "*$@*"; }
source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/heroku/bin:$PATH"
chruby ruby-2.4.0
export GOPATH=~/go
export GOROOT=/usr/local/opt/go/libexec
export GOBIN=$GOPATH/bin
export GO15VENDOREXPERIMENT=1
export PATH=$PATH:$GOBIN
export HIST_IGNORE_SPACE=1
eval "$(thefuck --alias)"
