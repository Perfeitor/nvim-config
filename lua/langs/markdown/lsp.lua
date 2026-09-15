-- =============================================
--  MARKDOWN: Language Server (marksman)
-- =============================================
vim.lsp.config("marksman", {
  cmd = { "marksman", "server" },  -- server launch command
  filetypes = { "markdown", "markdown.mdx" },
  root_markers = { ".marksman.toml", ".git" },
  single_file_support = true,      -- works even with single files
})

vim.lsp.enable("marksman")
