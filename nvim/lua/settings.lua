-- Vim based settings
vim.o.termguicolors = true
vim.o.encoding = "utf-8"
vim.o.spelllang = "en_us"
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.colorcolumn = 119
vim.opt.listchars = { tab = "▸…", eol = "¬", trail = "•" }
vim.opt.list = true
vim.o.list = true
vim.o.mouse = "a"
vim.o.backspace = "indent,eol,start"
vim.o.ruler = true
vim.o.number = true
vim.o.title = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.showmatch = true
vim.o.autoindent = true
vim.o.hlsearch = true
vim.wo.wrap = false
vim.o.cursorline = true
vim.o.confirm = true
vim.o.clipboard = "unnamed"
vim.g.mapleader = " "
vim.o.updatetime = 500

vim.api.nvim_set_keymap("i", "jkl", "<ESC>", {})
vim.api.nvim_set_keymap("n", "<LEADER>w", ":w! <CR>", {})
vim.api.nvim_set_keymap("n", "<LEADER>q", ":q! <CR>", {})
vim.api.nvim_set_keymap("n", "<LEADER>t", ":tabnew <CR>", {})
vim.api.nvim_set_keymap("n", "<LEADER>s", ":set spell! <CR>", {})
vim.api.nvim_set_keymap("n", "<LEADER><Space>", ':let @/="" <CR>', {})
vim.api.nvim_set_keymap("n", "<C-t>", ":terminal <CR>", { silent = true })
vim.api.nvim_set_keymap("n", "Q", "<NOP>", { silent = true })
vim.api.nvim_set_keymap("n", "cp", ':let @* = expand("%") <CR>', {})
vim.api.nvim_set_keymap("n", "<LEADER>n", ":NERDTreeToggle <CR>", {})
vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files <CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-q>", ":Telescope live_grep <CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-b>", ":Telescope git_branches <CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<M-LeftMouse>", ":GBrowse <CR>", { silent = true })

-- LSP config
-- rely on <C-o> to go forward and <C-i> to go back between
vim.api.nvim_set_keymap("n", "<LEADER>d", ":Telescope lsp_definitions <CR>", {})
vim.api.nvim_set_keymap("n", "<LEADER>r", ":Telescope lsp_references<CR>", {})

-- Function to check if a floating dialog exists and if not
-- then check for diagnostics under the cursor
function OpenDiagnosticIfNoFloat()
  for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.api.nvim_win_get_config(winid).zindex then
      return
    end
  end
  -- THIS IS FOR BUILTIN LSP
  vim.diagnostic.open_float(0, {
    scope = "cursor",
    focusable = false,
    close_events = {
      "CursorMoved",
      "CursorMovedI",
      "BufHidden",
      "InsertCharPre",
      "WinLeave",
    },
  })
end
-- Show diagnostics under the cursor when holding position
vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  pattern = "*",
  command = "lua OpenDiagnosticIfNoFloat()",
  group = "lsp_diagnostics_hold",
})

-- Colorscheme
vim.cmd("colorscheme tokyonight")
vim.cmd("syntax on")
