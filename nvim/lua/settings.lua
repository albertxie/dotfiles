-- Editor Settings
vim.cmd("syntax on")
vim.o.termguicolors = true
vim.o.encoding='utf-8'
vim.o.spelllang='en_us'
vim.o.expandtab=true
vim.o.tabstop=2
vim.o.shiftwidth=2
vim.o.colorcolumn=119
vim.opt.listchars = {tab = "▸…", eol = '¬', trail = "•"}
vim.opt.list = true
vim.o.list=true
vim.o.mouse='a'
vim.o.backspace='indent,eol,start'
vim.o.ruler=true
vim.o.number=true
vim.o.title=true
vim.o.ignorecase=true
vim.o.smartcase=true
vim.o.incsearch=true
vim.o.showmatch=true
vim.o.autoindent=true
vim.o.hlsearch=true
vim.g.nowrap=true
vim.o.cursorline=true
vim.o.confirm=true
vim.g.noswapfile=true
vim.o.clipboard='unnamed'


-- Keybinding Leader
vim.g.mapleader=' '


-- Helper method to create bindings defaulting to noremap
function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- curry functions shorthand insert/normal mode mappingss
function nmap(lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end

function imap(lhs, rhs, opts)
  map('i', lhs, rhs, opts)
end

-- Key Mappings
imap('jkl', '<ESC>')
nmap('<LEADER>w', ':w! <CR>')
nmap('<LEADER>q', ':q! <CR>')
nmap('<LEADER>t', ':tabnew <CR>')
nmap('<LEADER>s', ':set spell! <CR>')
nmap('<LEADER><Space>', ':let @/="" <CR>')
nmap('<C-t>', ':terminal <CR>', {silent=true})
nmap('Q', '<NOP>', {silent=true})
nmap('cp', ':let @* = expand("%") <CR>')
nmap('<LEADER>n', ':NERDTreeFocus <CR>')
nmap('<C-p>', ':Telescope find_files <CR>', {silent=true})
nmap('<C-q>', ':Telescope live_grep <CR>', {silent=true})
nmap('<C-b>', ':Telescope git_branches <CR>', {silent=true})

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


-- Colorscheme
vim.cmd("colorscheme tokyonight")
