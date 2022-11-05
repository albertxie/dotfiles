-- [[
-- Settings
-- ]]


-- Vim based settings
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
vim.g.mapleader=' '


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


-- Colorscheme
vim.cmd("colorscheme tokyonight")
vim.cmd("syntax on")
