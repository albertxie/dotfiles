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
-- hide in line warnings
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = true,
    signs = true,
  }
)

-- git sign configs
require('gitsigns').setup {
  signcolumn = false,
  numhl      = true,
}


-- lualine config 
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
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
