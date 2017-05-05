require 'rake'

task :vim do
  sh "mkdir -p ~/.vim"
  sh "git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle"
  sh "git clone https://github.com/powerline/fonts.git ~/.vim/fonts"
  sh "~/.vim/fonts/install.sh"
  sh "ln -s -F `pwd`/.vimrc ~/.vimrc"
  sh "ln -s -F `pwd`/.vimpagerrc ~/.vimpagerrc"
  sh "vim +BundleInstall! +BundleClean +qall"
end

task :zsh do
  sh "curl -L http://install.ohmyz.sh | sh"
  sh "chsh -s /usr/local/bin/zsh"
  sh "ln -s -F `pwd`/.zshrc ~/.zshrc"
end

task :ruby do
  sh 'ruby-install ruby'
  sh 'exec $SHELL'
  sh "gem install bundler; bundle install --system"
end

task :homebrew do
  sh '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
  sh 'brew tap homebrew/dupes'
  sh 'brew bundle install'
end

task :tmux do
  sh "git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"
  sh "ln -s -F `pwd`/.tmux.conf ~/.tmux.conf"
  sh "tmux source ~/.tmux.conf"
end

task :dotfiles do
  sh "ln -s -F `pwd`/.dircolors ~/.dircolors"
  sh "ln -s -F `pwd`/.gemrc ~/.gemrc"
  sh "ln -s -F `pwd`/.tmux.conf ~/.tmux.conf"
  sh "ln -s -F `pwd`/.gitconfig ~/.gitconfig"
  sh "ln -s -F `pwd`/.gitignore_global ~/.gitignore_global"
end

task :me => [:homebrew, :ruby, :zsh, :vim, :tmux, :dotfiles]
