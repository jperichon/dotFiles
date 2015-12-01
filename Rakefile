require 'rake'

task :vim do
  begin
    sh "mkdir -p ~/.vim"
    sh "ln -s -F `pwd`/.vimrc ~/.vimrc"
    sh "ln -s -F `pwd`/.vimpagerrc ~/.vimpagerrc"

    sh "git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle"
    sh "vim +BundleInstall! +BundleClean +qall"
  rescue => e
    puts e.message
  end
end

task :zsh do
  begin
    sh "curl -L http://install.ohmyz.sh | sh"
    sh "chsh -s /usr/local/bin/zsh"

    sh "ln -s -F `pwd`/.zshrc ~/.zshrc"
  rescue => e
    puts e.message
  end
end

task :ruby do
  begin
    sh 'brew install chruby'
    sh 'brew install ruby-install'
    sh 'ruby-install ruby 2.0'

    sh 'exec $SHELL'

    gems = [ 'bundler', 'rails', 'libv8', 'therubyracer', 'powder', 'localtunnel' ]
    sh "gem install #{gems.join(' ')}"
  rescue => e
    puts e.message
  end
end

task :homebrew do
  begin

    sh 'brew tap homebrew/dupes'
    sh 'brew tap josegonzalez/homebrew-php'
    sh 'brew tap caskroom/cask'
    sh 'brew install brew-cask'

    brews = [
      "ag", "git", "apple-gcc43", "android-sdk", "autojump", "bash", "boost", "cmake",
      "colordiff", "colormake", "colorsvn", "colortail", "ctags", "curl", "dos2unix",
      "doxygen", "ffmpeg", "gettext", "heroku-toolbelt", "highlight", "htop-osx",
      "jetty", "jsonpp", "markdown", "mercurial", "maven", "mongodb", "node",
      "openssh", "php54", "python", "sqlite", "subversion", "reattach-to-user-namespace",
      "tomcat", "tmux", "trash", "valgrind", "vim", "vimpager", "wget", "youtube-dl",
      "zsh", "redis", "rbenv", "ruby-build", "v8"
    ]

    cask_brews = [
      "adobe-reader", "alfred", "anvil", "appcleaner", "caffeine", "dropbox",
      "flux", "firefox", "flash-player", "gitx", "google-chrome", "google-hangouts",
      "iterm2", "mplayerx", "textmate", "transmission", "slate", "silverlight",
      "skype", "xquartz", "wireshark"
    ]

    sh "brew install #{brews.join(' ')}"
    sh "brew cask install #{cask_brews.join(' ')}"
  rescue => e
    puts e.message
  end
end

task :dotfiles do
  begin
    sh "ln -s -F `pwd`/.colorsvnrc ~/.colorsvnrc"
    sh "ln -s -F `pwd`/.dircolors ~/.dircolors"
    sh "ln -s -F `pwd`/.gemrc ~/.gemrc"
    sh "ln -s -F `pwd`/.lighttpd.conf ~/.lighttpd.conf"
    sh "ln -s -F `pwd`/.ls++.conf ~/.ls++.conf"
    sh "ln -s -F `pwd`/.tmux.conf ~/.tmux.conf"
    sh "ln -s -F `pwd`/.gitconfig ~/.gitconfig"
  rescue => e
    puts e.message
  end
end

task :osx do
  begin
    sh "defaults write NSGlobalDomain NSWindowResizeTime 0.01"
    # key repeat
    sh "defaults write -g ApplePressAndHoldEnabled -bool false"
    # set the Library visible
    sh "chflags nohidden ~/Library"
    # disable spotlight icon
    sh "sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search"
    sh "killall SystemUIServer"
    # dock in 2d
    sh "defaults write com.apple.dock no-glass -boolean YES"
    sh "killall dock"
    # disable spell correction
    sh "defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool NO"
    # disable gatekeeper
    sh "sudo spctl --master-disable"
    # prevent iTunes from launching with the media keys
    sh "sudo launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist"
    sh "sudo chown root:wheel /Library/LaunchDaemons/com.nullvision.noatime.plist"
    # switch from sleep to hibernation mode after a longer period of inactivity
    sh "sudo pmset -a standbydelay 7200"
    # Preferences > Energy Saver > Turn off 'Put the hard disk to sleep when possible'
  rescue => e
    puts e.message
  end
end

task :me => [:homebrew, :ruby, :zsh, :vim, :dotfiles, :osx]
