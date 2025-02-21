vim.g.mapleader = " "          -- Set leader key to Space

-- Save and quit
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = "Save file" })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = "Quit Neovim" })

-- Clipboard mappings
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, desc = "Yank to system clipboard" })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, desc = "Yank to system clipboard" })
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true, desc = "Paste from system clipboard" })
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', { noremap = true, desc = "Paste from system clipboard" })

-- Delete without affecting clipboard
vim.api.nvim_set_keymap('n', 'd', '"_d', { noremap = true, desc = "Delete without clipboard" })
vim.api.nvim_set_keymap('v', 'd', '"_d', { noremap = true, desc = "Delete without clipboard" })

-- Cut without affecting clipboard
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true, desc = "Cut without clipboard" })
vim.api.nvim_set_keymap('v', 'x', '"_x', { noremap = true, desc = "Cut without clipboard" })

-- Change without affecting clipboard
vim.api.nvim_set_keymap('n', 'c', '"_c', { noremap = true, desc = "Change without clipboard" })
vim.api.nvim_set_keymap('v', 'c', '"_c', { noremap = true, desc = "Change without clipboard" })

-- Custom mappings for clipboard interaction
vim.api.nvim_set_keymap('n', '<leader>d', '""d', { noremap = true, desc = "Delete to default register" })
vim.api.nvim_set_keymap('v', '<leader>d', '""d', { noremap = true, desc = "Delete to default register" })
vim.api.nvim_set_keymap('n', '<leader>x', '""x', { noremap = true, desc = "Cut to default register" })
vim.api.nvim_set_keymap('v', '<leader>x', '""x', { noremap = true, desc = "Cut to default register" })
vim.api.nvim_set_keymap('n', '<leader>c', '""c', { noremap = true, desc = "Change to default register" })
vim.api.nvim_set_keymap('v', '<leader>c', '""c', { noremap = true, desc = "Change to default register" })

-- Window navigation
vim.api.nvim_set_keymap('n', '<C-W>j', '<C-W><C-J>', { noremap = true, desc = "Move to window below" })
vim.api.nvim_set_keymap('n', '<C-W>k', '<C-W><C-K>', { noremap = true, desc = "Move to window above" })
vim.api.nvim_set_keymap('n', '<C-W>l', '<C-W><C-L>', { noremap = true, desc = "Move to window right" })
vim.api.nvim_set_keymap('n', '<C-W>h', '<C-W><C-H>', { noremap = true, desc = "Move to window left" })

-- Split screen
vim.api.nvim_set_keymap('n', '<C-W>s', ':split<CR>', { noremap = true, desc = "Horizontal split" })
vim.api.nvim_set_keymap('n', '<C-W>v', ':vsplit<CR>', { noremap = true, desc = "Vertical split" })

-- Run Python
vim.api.nvim_set_keymap('n', '<leader>r', ':w<CR>:tabnew | term python3 %<CR>', { noremap = true, silent = true, desc = "Run Python file" })

-- Go to tab by number
for i = 1, 9 do
  vim.api.nvim_set_keymap('n', '<leader>'..i, i..'gt', { noremap = true, desc = "Go to tab "..i })
end

-- Select all
vim.api.nvim_set_keymap('n', '<leader>a', 'ggVG', { noremap = true, desc = "Select all" })

-- LSP autoformat
vim.keymap.set('n', '<leader>l', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true, desc = "Format file" })

-- Go to definition in new tab
vim.keymap.set('n', 'gd', function()
  vim.cmd('tab split')
  vim.lsp.buf.definition()
end, { noremap = true, silent = true, desc = "Go to definition in new tab" })
