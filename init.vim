" sh -c 'curl -fLo "~/.config/nvim/site/autoload/plug.vim" --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

set termguicolors " use true colors in the terminal

call plug#begin('~/.vim/plugged2')
" ----------------------------------------------------------------------

Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'projekt0n/github-nvim-theme'
Plug 'f-person/git-blame.nvim'



runtime macros/matchit.vim
" ----------------------------------------------------------------------
call plug#end()

" source extra settings
source ~/.nvim.vim
