-- [[
-- Plugin configurations
-- ]]


-- setup Comment
require('Comment')


-- setup Github helpers
require('github')


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
require'lspconfig'.hhvm.setup{}
require'lspconfig'.ccls.setup {
  init_options = {
    cache = {
      directory = ".ccls-cache"
    };
  }
}
require'lspconfig'.ltex.setup{}


-- git sign configs
require('gitsigns').setup {
  signcolumn = false,
  numhl      = true,
}


-- lightline config
vim.g.lightline = {
  colorscheme= 'tokyonight'
}


-- coq
vim.g.coq_settings = { auto_start='shut-up' }


-- ale
vim.g.ale_sign_error = '●'
vim.g.ale_sign_warning = '.'
vim.g.ale_lint_on_save = 1
vim.g.ale_fix_on_save = 1
vim.g.ale_linters = {
  hack = {'hack', 'hhast'},
  python = {'black'},
  ruby = {'rubocop'}
}
vim.api.nvim_exec(
[[
let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \  'hack': ['hackfmt'],
  \}
  ]],
true)
