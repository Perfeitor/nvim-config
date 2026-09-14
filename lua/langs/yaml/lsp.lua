-- =============================================
--  YAML: Language Server (yamlls)
-- =============================================
vim.lsp.config("yamlls", {
  filetypes = { "yaml" },
  root_markers = { ".git" },
  single_file_support = true,
})

vim.lsp.enable("yamlls")
