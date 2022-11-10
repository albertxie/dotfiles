-- [[
-- Plugins
--
-- Since vim-plug is written in vim script
-- we need to implement this wrapper
-- to invoke vim command within a lua call
--
-- Note:
-- 'for' and 'do' are reserved in lua
-- Need to rewrite as [[ for ]], [[ do ]]
--
-- ]]


local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.0' })
Plug 'preservim/nerdtree'
Plug 'tpope/vim-rails'
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdateSync'})
Plug('ms-jpq/coq_nvim', { branch = 'coq'})
Plug('ms-jpq/coq.artifacts', { branch = 'artifacts'})
Plug 'numToStr/Comment.nvim'
Plug 'hhvm/vim-hack'
Plug 'dense-analysis/ale'
Plug 'ghifarit53/tokyonight-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug("https://git.sr.ht/~whynothugo/lsp_lines.nvim")

vim.call('plug#end')
