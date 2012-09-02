ZSH=$HOME/.oh-my-zsh
ZSH_THEME="steeef"
DISABLE_AUTO_UPDATE="true"
plugins=(git gem brew osx ssh autojump extract vi-mode)
source $ZSH/oh-my-zsh.sh

#custom aliases
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
setopt INTERACTIVE_COMMENTS

function mkcd {
  dir="$*";
  mkdir -p "$dir" && cd "$dir";
}

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/bin:/usr/local/sbin:$HOME/Projects/scripts
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/r20.0.1

#load rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
__rvm_project_rvmrc
