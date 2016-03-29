ZSH=$HOME/.oh-my-zsh

# git aliases
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gti='git'
alias vmi='vim'
alias ivm='vim'
# custom aliases
alias pw='pwd'
alias svn='colorsvn'
alias svnu='colorsvn update'
alias make='colormake'
alias top='htop'
alias tail='tail'
alias diff='colordiff'
alias ls='ls --color=auto'
# alias ls='ls++'
alias clr='clear'
alias cls='clear'
alias lighttpd.local='lighttpd -f $HOME/.lighttpd.conf &'
alias lighttpd.stop='killall lighttpd'
alias mkdir='mkdir -p'
alias v='vim'
alias tomcat='catalina'
alias youtube-dl-mp3='youtube-dl -t --extract-audio --audio-format=mp3'
alias flushdns='dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say flushed'

export PAGER="vimpager"
export EDITOR="vim"
export SVN_EDITOR="vim"
export GIT_EDITOR="vim"
export TERM=xterm-256color
setopt INTERACTIVE_COMMENTS

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

plugins=(git git-flow docker docker-compose heroku rake-fast capistrano colored-man cp chruby rails
rake bundler gem brew osx ssh autojump extract vi-mode tmuxinator bower history-substring-search)

export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/r20.0.3
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/bin:/usr/local/sbin:$HOME/Projects/scripts:/usr/local/share/npm/bin
export PATH="/usr/local/share/python3:$PATH"
export CLICOLOR_FORCE=1
export ZSH_THEME="pure"

[[ -f `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

function fname() { find . -iname "*$@*"; }
source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/heroku/bin:$PATH"
chruby ruby-2.1.5
