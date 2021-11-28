" use true colors in the terminal
set termguicolors 


call plug#begin('~/.vim/plugged')
" ----------------------------------------------------------------------

Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug '907th/vim-auto-save'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'ludovicchabant/vim-gutentags
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'numToStr/Comment.nvim'
Plug 'ghifarit53/tokyonight-vim'

" ----------------------------------------------------------------------
call plug#end()

" additional plugin setup
lua require('Comment').setup()

" source extra settings
source ~/.nvim.vim
