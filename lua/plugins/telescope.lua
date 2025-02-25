require('telescope').setup {
  defaults = {
    prompt_prefix = "🔍 ",
    selection_caret = " ",
    path_display = { "truncate" },
    mappings = {
      i = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
        ["<C-q>"] = require('telescope.actions').send_to_qflist + require('telescope.actions').open_qflist,
        ["<CR>"] = function(prompt_bufnr)
          local selection = require('telescope.actions.state').get_selected_entry()
          require('telescope.actions').close(prompt_bufnr)
          vim.cmd('tabnew ' .. vim.fn.fnameescape(selection.path or selection[1]))
        end,
      },
      n = { -- Adding normal mode mapping for consistency
        ["<CR>"] = function(prompt_bufnr)
          local selection = require('telescope.actions.state').get_selected_entry()
          require('telescope.actions').close(prompt_bufnr)
          vim.cmd('tabnew ' .. vim.fn.fnameescape(selection.path or selection[1]))
        end,
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
