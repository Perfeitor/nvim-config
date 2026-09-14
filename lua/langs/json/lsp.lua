-- =============================================
--  JSON: Language Server (jsonls)
-- =============================================
vim.lsp.config("jsonls", {
  filetypes = { "json", "jsonc" },
  root_markers = { ".git" },
  single_file_support = true,
})

vim.lsp.enable("jsonls")
