-- ~/.config/nvim/lua/plugins/telescope.lua
require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'grep', '-r', '--line-number', '--no-heading', '--color=never', '--exclude-dir={.git,node_modules}'
    },
    prompt_prefix = "🔍 ",
    selection_caret = " ",
    path_display = { "truncate" },
    mappings = {
      i = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
        ["<C-q>"] = require('telescope.actions').send_to_qflist + require('telescope.actions').open_qflist,
      },
    },
  },
  pickers = {
    find_files = { hidden = true },
  },
}
require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Search Buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help Tags" })
