require 'rake'

def link_dotfile(filename, destination_dir = "~/")
  sh "ln -s -F `pwd`/#{filename} #{destination_dir}#{filename}"
end

task :vim do
  sh "mkdir -p ~/.vim"
  sh "git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim"
  sh "git clone https://github.com/powerline/fonts.git ~/.vim/fonts"
  sh "~/.vim/fonts/install.sh"
  link_dotfile('.vimrc')
  link_dotfile('.vimpagerrc')
  sh "vim +PluginInstall +qall"
end

task :zsh do
  sh "curl -L http://install.ohmyz.sh | sh"
  sh "sudo sh -c 'echo $(which zsh) >> /etc/shells'"
  sh "chsh -s $(which zsh)"
  link_dotfile('.zshrc')
end

task :osx do
  # Blazingly fast keyboard repeat rate
  sh "defaults write NSGlobalDomain KeyRepeat -int 1"

  # Shorter Delay until key repeat
  sh "defaults write NSGlobalDomain InitialKeyRepeat -int 10"

  # Auto-hide Dock
  sh "defaults write com.apple.Dock autohide -bool TRUE; killall Dock"

  # Disable sound effects
  sh "defaults write com.apple.systemsound 'com.apple.sound.uiaudio.enabled' -int 0"

  # Enable dark mode
  sh "sudo defaults write /Library/Preferences/.GlobalPreferences.plist _HIEnableThemeSwitchHotKey -bool true"

  # # Disable spotlight shortcuts
  # sh "/usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c" \
  #   "Set AppleSymbolicHotKeys:64:enabled false"

  # Disable natural scrolling
  sh "defaults write -g com.apple.swipescrolldirection -bool NO"
end

task :ruby do
  link_dotfile('.gemrc')
  sh 'ruby-install ruby'
  sh 'exec $SHELL'
  sh "gem install bundler"
end

task :homebrew do
  sh '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  sh 'echo \'eval "$(/opt/homebrew/bin/brew shellenv)"\' >> ~/.zprofile'
  sh 'eval "$(/opt/homebrew/bin/brew shellenv)"'
  sh 'brew bundle install'
end

task :tmux do
  sh "git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"
  link_dotfile('.tmux.conf')
  sh "tmux source ~/.tmux.conf"
end

task :dotfiles do
  sh 'mkdir -p ~/config'
  sh 'mkdir -p ~/.ssh'
  link_dotfile('.dircolors')
  link_dotfile('.gitconfig')
  link_dotfile('.gitignore_global')
  link_dotfile('alacritty.yml', "~/config/")
  link_dotfile('.ssh/config')
end

task :teleport do
  sh "curl https://teleport-static.checkrhq.net/teleport_darwin.tar.gz | tar xvx"
  sh "sudo teleport-ent/install"
  sh "rm -rf teleport-ent"
end

task :install => [:homebrew, :ruby, :zsh, :vim, :tmux, :dotfiles, :teleport]
