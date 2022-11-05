-- vim-plug associated settings

-- since vim-plug is written in vim script, we need to implement this wrapper
-- to invoke vim command within a lua call
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.0' })
Plug('hashivim/vim-terraform', { for = 'terraform' })
Plug 'preservim/nerdtree'
Plug 'tpope/vim-rails'
Plug('nvim-treesitter/nvim-treesitter', {do = ':TSUpdateSync'})
Plug('ms-jpq/coq_nvim', {branch = 'coq'})
Plug('ms-jpq/coq.artifacts', {branch = 'artifacts'})
Plug 'numToStr/Comment.nvim'
Plug 'hhvm/vim-hack'
Plug 'dense-analysis/ale'
Plug 'ghifarit53/tokyonight-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'

vim.call('plug#end')
