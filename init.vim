" use true colors in the terminal
set termguicolors 


call plug#begin('~/.vim/plugged')
" ----------------------------------------------------------------------

Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'preservim/nerdtree'
Plug 'tpope/vim-rails'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'numToStr/Comment.nvim'
Plug 'hhvm/vim-hack'
Plug 'dense-analysis/ale'
Plug 'ghifarit53/tokyonight-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

" ----------------------------------------------------------------------
call plug#end()


" setup comment.nvim
lua require('Comment').setup()

" setup nvim-treesitter
lua <<EOF
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
      enable = true,
    },
  }
EOF

" setup LSPs
lua << EOF
  require'lspconfig'.pyright.setup{}
  require'lspconfig'.solargraph.setup{}
EOF

" gitsigns
lua << EOF
  require('gitsigns').setup {
    signcolumn = false,
    numhl      = true,
  }
EOF


" source extra settings
source ~/.nvim.vim
