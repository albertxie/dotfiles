-- Editor Settings

vim.o.termguicolors = true
vim.o.syntax = true
vim.o.encoding='utf-8'
vim.o.spelllang='en_us'
vim.o.expandtab=true
vim.o.tabstop=2
vim.o.shiftwidth=2
vim.o.colorcolumn=119
vim.o.listchars='=tab:▸…,eol:¬,trail:•'
vim.o.list=true
vim.o.mouse='a'
vim.o.backspace='indent,eol,start'
vim.o.ruler=true
vim.o.number=true



-- nvim-treesitter configs
require'nvim-treesitter.configs'.setup {
  ensure_installed = {'python', 'c', 'java', 'php', 'hack', 'ruby'},
  highlight = {
    enable = true,
  },
}

-- lsp configs
require'lspconfig'.pyright.setup{}
require'lspconfig'.solargraph.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.ccls.setup {
  init_options = {
    cache = {
      directory = ".ccls-cache"
    };
  }
}

-- git sign configs
require('gitsigns').setup {
  signcolumn = false,
  numhl      = true,
}
