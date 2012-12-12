DISABLE_AUTO_UPDATE="true"
plugins=(git svn rails rails3 bundler gem brew osx ssh autojump extract vi-mode)
source $ZSH/oh-my-zsh.sh

# git aliases
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
# custom aliases
alias svn='colorsvn'
alias make='colormake'
alias tail='colortail'
alias diff='colordiff'
# alias ls='ls --color=auto'
alias ls='ls++'
alias clr='clear'
alias cls='clear'
alias windows='VBoxManage startvm "Windows 7"'
alias archlinux='VBoxManage startvm "Arch Linux"'
alias lighttpd.start='lighttpd -f /Users/jperichon/.lighttpd.conf &'
alias lighttpd.stop='killall lighttpd'
alias mkdir='mkdir -p'
alias v='vim'
alias m='mvim'
alias tomcat='catalina'
alias youtube-dl-mp3='youtube-dl -t --extract-audio --audio-format=mp3'
export PAGER="vimpager"
export EDITOR="vim"
export SVN_EDITOR="vim"
export GIT_EDITOR="vim"
setopt INTERACTIVE_COMMENTS

# makes less more colorful. we use vimpager anyway ...
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

function mkcd {
  dir="$*";
  mkdir -p "$dir" && cd "$dir";
}

export PATH=/usr/local/lib/cw:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/bin:/usr/local/sbin:$HOME/Projects/scripts

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/r20.0.3
eval "$(rbenv init -)"

[[ -f `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
