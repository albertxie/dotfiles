set termguicolors " use true colors in the terminal


call plug#begin('~/.vim/plugged2')
" ----------------------------------------------------------------------

Plug 'projekt0n/github-nvim-theme'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug '907th/vim-auto-save'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'

" ----------------------------------------------------------------------
call plug#end()


" source extra settings
source ~/.nvim.vim
