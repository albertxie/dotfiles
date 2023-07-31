# Install NeoVim
# https://github.com/neovim/homebrew-neovim
brew update
brew install neovim


# Plugin Dependencies
brew install ripgrep
brew install fzf
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
brew tap hhvm/hhvm
brew install hhvm

# Setup fzf in terminal
$(brew --prefix)/opt/fzf/install
source ~/.zshrc

# Install LSPs
npm i -g pyright                # Python
brew install ccls               # C/C++
brew install ltex-ls            # LaTeX/Markdown
gem install solargraph          # Ruby


# Copy nvim config
mkdir -p ~/.config
# Create symlink from neovim dotfiles repo to .config
# ensure changes to dotfiles are tracked
ln -s ~/dotfiles/nvim ~/.config/
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/dotfiles/utils/b.rb ~/b.rb
ln -s ~/dotfiles/utils/h.rb ~/h.rb
