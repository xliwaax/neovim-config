vim.api.nvim_create_augroup("RestoreCursorShapeOnExit", { clear = true })
vim.api.nvim_create_autocmd("VimLeave", {
  group = "RestoreCursorShapeOnExit",
  callback = function()
    vim.opt.guicursor = "a:ver20"
  end
})
