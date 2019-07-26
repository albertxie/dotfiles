echo "Setting up new vim env" 

# Setup 
mkdir .vim/bundle
cd .vim/bundle

# Installing Plugins
git clone https://github.com/itchyny/lightline.vim
git clone https://github.com/zxqfl/tabnine-vim
git clone https://github.com/tpope/vim-fugitive.git
vim -u NONE -c "helptags vim-fugitive/doc" -c q
git clone git://github.com/airblade/vim-gitgutter.git
git clone https://github.com/ctrlpvim/ctrlp.vim.git
