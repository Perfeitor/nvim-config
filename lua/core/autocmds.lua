-- =============================================
--  SHARED AUTOCMDS
--  (Language-specific autocmds live in
--   lua/langs/<name>/autocmds.lua;
--   plugin-specific autocmds live in
--   lua/plugins/<plugin>.lua)
-- =============================================

-- Update the window title with the root directory name
vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
  callback = function()
    local root = vim.fn.getcwd()
    vim.opt.titlestring = "Nvim: " .. vim.fn.fnamemodify(root, ":t")
  end,
})

-- Autoreload file when changed outside of nvim
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  pattern = "*",
  command = "checktime",
})
