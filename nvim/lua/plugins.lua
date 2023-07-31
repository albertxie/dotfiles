-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- define plugins and configuration
plugins = {
  {
    "ghifarit53/tokyonight-vim",
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
  },
  {
    "preservim/nerdtree",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = {'python', 'c', 'java', 'php', 'hack', 'ruby'},
        highlight = {
          enable = true,
        },
      }
    end,
  },
  {
    "tpope/vim-rails",
  },
  {
    "ms-jpq/coq_nvim",
    branch = "coq",
    config = function()
      vim.g.coq_settings = { auto_start='shut-up' }
    end,
  },
  {
    "ms-jpq/coq.artifacts",
    branch = "artifacts",
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require('Comment')
    end,
  },
  {
    "hhvm/vim-hack",
  },
  {
    "dense-analysis/ale",
    config = function()
      vim.g.ale_sign_error = '●'
      vim.g.ale_sign_warning = '.'
      vim.g.ale_lint_on_save = 1
      vim.g.ale_fix_on_save = 1
      vim.g.ale_linters = {
        hack = {'hack', 'hhast'},
        python = {'black'},
        ruby = {'rubocop'}
      }
      vim.api.nvim_exec([[ let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'], 'hack': ['hackfmt'], } ]], true)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
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
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup {
        signcolumn = false,
        numhl      = true,
      }
    end,
  },
  {
    "tpope/vim-fugitive",
    dependencies = {
      "tpope/vim-rhubarb",
    },
  },
  "ryanoasis/vim-devicons",
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    init = function() vim.g.barbar_auto_setup = false end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
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
    end,
  }
}

opts = {}
require("lazy").setup(plugins, opts)
