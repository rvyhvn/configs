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

require("lazy").setup({
  {
    "ellisonleao/gruvbox.nvim"
  },
  {
    "neoclide/coc.nvim",
    branch = "release",
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons", }
  },
  {
    'windwp/nvim-autopairs',
    enabled = true,
    opts = {}
  },
  {
    'nvim-treesitter/nvim-treesitter',
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  },
  {
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    "aserowy/tmux.nvim",
  },
  {
    "tpope/vim-fugitive"
  },
  {
    "stevearc/resession.nvim",
    opts = {},
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      -- 'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      animation = true,
      insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  {
    'echasnovski/mini.animate',
    version = '*',
    enabled = true,
  },
  {
    "folke/zen-mode.nvim",
    opts = {}
  },
  {
    "mg979/vim-visual-multi",
  },
  {
    "RRethy/nvim-treesitter-endwise",
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 100
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {

    "ellisonleao/carbon-now.nvim",
    lazy = true,
    cmd = "CarbonNow",
    ---@param opts cn.ConfigSchema
    opts = {}
  },
  {
    'TobinPalmer/pastify.nvim',
    cmd = { 'Pastify', 'PastifyAfter' },
    config = function()
      require('pastify').setup {
        opts = {
          apikey = "b69c8f588bd3848d019177727bbfc330", -- Needed if you want to save online.
        },
      }
    end
  },

})
require("base")
