local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "sainnhe/gruvbox-material", config = function() require("plugins.colorscheme") end },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = function() require("plugins.treesitter") end },
  { "nvim-lualine/lualine.nvim", config = function() require("plugins.lualine") end },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" }, config = function() require("plugins.telescope") end },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { "kyazdani42/nvim-tree.lua", config = function() require("plugins.nvim-tree") end },
  { "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip",
    },
    config = function() require("plugins.cmp") end,
  },
  { "neovim/nvim-lspconfig", config = function() require("plugins.lsp") end },
  { "williamboman/mason.nvim", build = ":MasonUpdate" },
  { "williamboman/mason-lspconfig.nvim" },
  { "lewis6991/gitsigns.nvim", config = function() require("plugins.gitsigns") end },
  { "windwp/nvim-autopairs", config = function() require("plugins.autopairs") end },
  { "numToStr/Comment.nvim", config = function() require("plugins.comment") end },
  { "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui", "mfussenegger/nvim-dap-python",
      "jay-babu/mason-nvim-dap.nvim", "nvim-neotest/nvim-nio",
    },
    config = function() require("plugins.dap") end,
  },
  { "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require("plugins.null-ls") end,
  },
  { "github/copilot.vim", config = function() require("plugins.copilot") end },
  { "nvim-tree/nvim-web-devicons", config = function() require("plugins.nvim-web-devicons") end },
  -- { "folke/tokyonight.nvim", lazy = false, priority = 1000, config = function() require("plugins.colorscheme") end },
})
