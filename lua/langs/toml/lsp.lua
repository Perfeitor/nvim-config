-- =============================================
--  TOML: Language Server (taplo)
-- =============================================
vim.lsp.config("taplo", {
  filetypes = { "toml" },
  root_markers = { ".git" },
  single_file_support = true,
})

vim.lsp.enable("taplo")
