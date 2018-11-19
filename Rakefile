require 'rake'

def link_dotfile(filename)
  sh "ln -s -F `pwd`/#{filename} ~/#{filename}"
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
  sh "chsh -s /usr/local/bin/zsh"
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

  # Disable spotlight shortcuts
  sh "/usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c" \
    "Set AppleSymbolicHotKeys:64:enabled false"
end

task :ruby do
  link_dotfile('.gemrc')
  sh 'ruby-install ruby'
  sh 'exec $SHELL'
  sh "gem install bundler"
end

task :homebrew do
  sh 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
  sh 'brew bundle install'
end

task :tmux do
  sh "git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"
  link_dotfile('.tmux.conf')
  sh "tmux source ~/.tmux.conf"
end

task :dotfiles do
  link_dotfile('.dircolors')
  link_dotfile('.gitconfig')
  link_dotfile('.gitignore_global')
end

task :install => [:homebrew, :ruby, :zsh, :vim, :tmux, :dotfiles]
