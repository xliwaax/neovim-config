require('nvim-tree').setup({
  disable_netrw = true,
  view = {
    width = 30,
    side = "left",
  },
  renderer = {
    highlight_opened_files = "all",
    icons = { show = { file = true, folder = true, folder_arrow = true, git = true } },
  },
})
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle NvimTree" })
vim.api.nvim_set_keymap('n', 't', ':lua require("nvim-tree.api").node.open.tab()<CR>', { noremap = true, silent = true, desc = "Open in new tab" })
