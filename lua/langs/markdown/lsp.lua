-- =============================================
--  MARKDOWN: Language Server (marksman)
-- =============================================
vim.lsp.config("marksman", {
  cmd = { "marksman", "server" },  -- lệnh khởi chạy server
  filetypes = { "markdown", "markdown.mdx" },
  root_markers = { ".marksman.toml", ".git" },
  single_file_support = true,      -- chạy được ngay cả với file đơn lẻ
})

vim.lsp.enable("marksman")
