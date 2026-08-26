-- =============================================
--  C#: Language Server (roslyn_ls)
-- =============================================
vim.lsp.config("roslyn_ls", {
  cmd = {
    "roslyn-language-server",
    "--stdio",
    "--autoLoadProjects",
  },
  filetypes = { "cs", "razor" }, -- áp dụng cho .cs và .razor
  root_markers = {               -- gốc dự án .NET
    "*.sln",
    "*.slnx",
    "*.csproj",
    ".git",
  },
})

-- Bật server; nếu chưa cài, mason-lspconfig tự tải về
vim.lsp.enable("roslyn_ls")
