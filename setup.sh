# Install NeoVim
# https://github.com/neovim/homebrew-neovim
brew update
brew install neovim


# Plugin Dependencies
brew install ripgrep
brew install fzf


# Install LSPs
python3 -m pip install pyright  # Python
brew install ccls               # C/C++
gem install solargraph          # Ruby


# Install vim-plug
# https://github.com/junegunn/vim-plug#unix-linux
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# Copy existing nvim init file to nvim dir and install
mkdir ~/.config/nvim
cp init.vim ~/.config/nvim
nvim +PlugInstall


# Copy .nvimv.vim
cp .nvim.vim ~/


# Post Install (nvim setup)
:TSInstall all
