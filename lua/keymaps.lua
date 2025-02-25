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
vim.api.nvim_set_keymap('n', '<leader>r', ':w<CR>:tabnew % | term python %<CR>', { noremap = true, silent = true, desc = "Run Python file" })

-- Go to tab by number
for i = 1, 9 do
  vim.api.nvim_set_keymap('n', '<leader>'..i, i..'gt', { noremap = true, desc = "Go to tab "..i })
end

-- Select all
vim.api.nvim_set_keymap('n', '<leader>a', 'ggVG', { noremap = true, desc = "Select all" })

-- LSP autoformat
vim.keymap.set('n', '<leader>l', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true, desc = "Format file" })

vim.keymap.set('n', 'gd', function()
  local params = vim.lsp.util.make_position_params()
  local results = vim.lsp.buf_request_sync(0, "textDocument/definition", params, 5000) -- Increased timeout

  if not results or vim.tbl_isempty(results) then
    vim.notify("No LSP definition results", vim.log.levels.WARN)
    return
  end

  local result = results[1] and results[1].result and results[1].result[1]
  if not result then
    vim.notify("No valid definition found", vim.log.levels.WARN)
    return
  end

  local target_uri = result.targetUri or result.uri
  local target_range = result.targetRange or result.range
  if not target_uri or not target_range then
    vim.notify("Missing URI or range", vim.log.levels.ERROR)
    return
  end

  local target_file = vim.uri_to_fname(target_uri)
  local target_line = target_range.start.line + 1

  -- Check if the file is already open in a tab
  for _, tabnr in ipairs(vim.api.nvim_list_tabpages()) do
    local win = vim.api.nvim_tabpage_get_win(tabnr)
    local buf = vim.api.nvim_win_get_buf(win)

    if vim.api.nvim_buf_get_name(buf) == target_file then
      vim.api.nvim_set_current_tabpage(tabnr)
      vim.api.nvim_win_set_cursor(win, { target_line, 0 })
      return
    end
  end

  -- Open in a new tab
  vim.cmd('tabnew ' .. vim.fn.fnameescape(target_file))
  vim.api.nvim_win_set_cursor(0, { target_line, 0 })
end, { noremap = true, silent = true, desc = "Go to definition in new tab or switch to existing" })
