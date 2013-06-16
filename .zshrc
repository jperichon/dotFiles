ZSH=$HOME/.oh-my-zsh

# git aliases
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
# custom aliases
alias svn='colorsvn'
alias svnu='colorsvn update'
alias make='colormake'
alias top='htop'
alias tail='tail'
alias diff='colordiff'
alias ls='ls --color=auto'
alias clr='clear'
alias cls='clear'
alias windows='VBoxManage startvm "Windows 7"'
alias archlinux='VBoxManage startvm "Arch Linux"'
alias lighttpd.local='lighttpd -f $HOME/.lighttpd.conf &'
alias lighttpd.stop='killall lighttpd'
alias mkdir='mkdir -p'
alias v='vim'
alias tomcat='catalina'
alias mvn='mvn-color'
alias youtube-dl-mp3='youtube-dl -t --extract-audio --audio-format=mp3'

export PAGER="vimpager"
export EDITOR="vim"
export SVN_EDITOR="vim"
export GIT_EDITOR="vim"
export TERM=xterm-256color
setopt INTERACTIVE_COMMENTS

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

plugins=(git capistrano colored-man cp svn rails3 rake bundler gem brew osx ssh autojump extract forklift mvn vi-mode tmuxinator)

export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/r20.0.3
export PATH=$HOME/.rbenv/shims:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/bin:/usr/local/sbin:$HOME/Projects/scripts:/usr/local/share/npm/bin
export PATH="/usr/local/share/python3:$PATH"

eval "$(rbenv init -)"
[[ -f `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

function fname() { find . -iname "*$@*"; }

source $HOME/.mogreet.sh
source $ZSH/oh-my-zsh.sh

PROMPT="%{$fg[yellow]%}%% %{$reset_color%}"
