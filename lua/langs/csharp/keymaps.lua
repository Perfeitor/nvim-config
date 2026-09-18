-- =============================================
--  C#: language-specific keymaps
--  Attached buffer-locally via a FileType autocmd, so they only
--  exist when a .cs file is open.
-- =============================================
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cs", "razor" },
  callback = function()
    vim.keymap.set("n", "<leader>B", function()
      require("overseer").run_task({ name = "dotnet build" })
    end, { buffer = true, desc = "Build project (async)" })
  end,
})
