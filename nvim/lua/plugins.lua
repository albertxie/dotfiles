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

-- define local plugins and setup
plugins = {
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  "preservim/nerdtree",
  "tpope/vim-rails",
  "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
  "ms-jpq/coq_nvim",  branch = "coq",
  "ms-jpq/coq.artifacts",  branch = "artifacts",
  "numToStr/Comment.nvim",
  "hhvm/vim-hack",
  "dense-analysis/ale",
  "ghifarit53/tokyonight-vim",
  "neovim/nvim-lspconfig",
  "lewis6991/gitsigns.nvim",
  "tpope/vim-fugitive",
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
    }
  }
}

opts = {}
require("lazy").setup(plugins, opts)
