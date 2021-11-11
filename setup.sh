# Install NeoVim
# https://github.com/neovim/homebrew-neovim
brew install neovim

# Install Plug 
# https://github.com/junegunn/vim-plug#unix-linux
sh -c 'curl -fLo "~/.config/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Copy existing nvim init file to nvim dir and install 
cp init.vim ~/.config/nvim
nvim +PlugInstall


# Copy .nvimv.vim
cp .nvim.vim ~/
