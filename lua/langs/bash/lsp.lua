-- =============================================
--  BASH: Language Server (bashls)
-- =============================================
vim.lsp.config("bashls", {
  filetypes = { "sh", "bash", "zsh" },
  root_markers = { ".git" },
  single_file_support = true,
})

vim.lsp.enable("bashls")
