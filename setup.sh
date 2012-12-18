#!/bin/bash

gems="rails libv8 therubyracer"
brews="android-sdk autojump bash boost cmake colordiff colormake 
    colorsvn colortail ctags curl doxygen erlang ffmpeg gettext hadoop highlight 
    htop-osx jetty jsonpp markdown mercurial maven node openssh php54 python qt 
    sqlite subversion tomcat valgrind vim vimpager macvim wget youtube-dl zsh rbenv 
    ruby-build v8"

promptyn () {
    while true; do
        read -p "$1 " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

function osx_tweaks() {
    echo -e "\033[38;5;148mApplying OSX tweaks\033[39m"
    # speed up dialog boxes
    defaults write NSGlobalDomain NSWindowResizeTime 0.01
    # key repeat
    defaults write -g ApplePressAndHoldEnabled -bool false
    # set the Library visible
    chflags nohidden ~/Library
    # disable spotlight icon
    sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
    killall SystemUIServer

    # dock in 2d
    defaults write com.apple.dock no-glass -boolean YES
    killall dock

    # disable spell correction
    defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool NO
    # disable gatekeeper
    sudo spctl --master-disable
    # prevent iTunes from launching with the media keys
    sudo launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist

    # noatime flag
    cat << EOF | sudo tee /Library/LaunchDaemons/com.nullvision.noatime.plist > /dev/null
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" 
        "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>Label</key>
        <string>com.nullvision.noatime</string>
        <key>ProgramArguments</key>
        <array>
            <string>mount</string>
            <string>-vuwo</string>
            <string>noatime</string>
            <string>/</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
    </dict>
</plist>
EOF
    sudo chown root:wheel /Library/LaunchDaemons/com.nullvision.noatime.plist

    # switch from sleep to hibernation mode after a longer period of inactivity
    sudo pmset -a standbydelay 7200
    # Preferences > Energy Saver > Turn off 'Put the hard disk to sleep when possible'
}

function setup_homebrew() {
    echo -e "\033[38;5;148mSetting up Homebrew\033[39m"
    require "curl"
    require "ruby"

    ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
    brew update
    brew tap homebrew/dupes
    brew tap josegonzalez/homebrew-php
    brew install git apple-gcc42
    exec $SHELL
    brew install $brews
}

function setup_zsh() {
    echo -e "\033[38;5;148mSetting up ZSH\033[39m"
    require "brew"
    require "curl"

    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
    chsh -s /bin/zsh

    ln -s -F ~/Projects/.zshrc ~/.zshrc
}

function setup_vim() {
    echo -e "\033[38;5;148mSetting up VIM\033[39m"
    require "vim"
    require "git"
    ln -s -F ~/Projects/.vimrc ~/.vimrc
    ln -s -F ~/Projects/.vimpagerrc ~/.vimpagerrc
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim +BundleInstall! +BundleClean +qall
}

function require() {
    command -v $1 >/dev/null 2>&1 || { echo "$1 is required. Aborting." >&2; exit 1; }
}

function dot_files() {
    echo -e "\033[38;5;148mCopying dot files\033[39m"
    require "git"
    git clone https://github.com/jperichon/dotFiles.git ~/Projects
    ln -s -F ~/Projects/.colorsvnrc ~/.colorsvnrc
    ln -s -F ~/Projects/.dircolors ~/.dircolors
    ln -s -F ~/Projects/.gemrc ~/.gemrc
    ln -s -F ~/Projects/.lighttpd.conf ~/.lighttpd.conf
    ln -s -F ~/Projects/.ls++.conf ~/.ls++.conf
}

function setup_ruby() {
    echo -e "\033[38;5;148mSetting up Ruby\033[39m"
    require "ruby"
    require "rbenv"
    require "curl"
    require "npm"
    rbenv install 1.9.3-p327
    rbenv rehash
    rbenv global 1.9.3-p327
    exec $SHELL
    gem install $gems
    curl get.pow.cx | sh
    npm install pow
}

require "xcodebuild"
setup_homebrew
dot_files
setup_zsh
setup_ruby
setup_vim
osx_tweaks
