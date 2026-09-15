-- =============================================
--  C#: language-specific keymaps
--  Attached buffer-locally via a FileType autocmd, so they only
--  exist when a .cs file is open.
-- =============================================
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cs", "razor" },
  callback = function()
    vim.keymap.set("n", "<leader>B", "<cmd>!dotnet build<cr>",
      { buffer = true, desc = "C#: Build project" })
  end,
})
