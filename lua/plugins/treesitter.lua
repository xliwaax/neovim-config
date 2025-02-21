-- ~/.config/nvim/lua/plugins/treesitter.lua
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"python", "lua"},
  highlight = { enable = true },
}
