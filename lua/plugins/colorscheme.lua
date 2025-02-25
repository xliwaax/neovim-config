require("tokyonight").setup({
  style = "storm",
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    sidebars = "dark",
    floats = "dark",
  }
})
vim.cmd([[colorscheme tokyonight-storm]])
