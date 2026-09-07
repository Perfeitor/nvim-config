-- =============================================
--  C#: Language Server (roslyn_ls)
-- =============================================
vim.lsp.config("roslyn_ls", {
  cmd = {
    "roslyn-language-server",
    "--stdio",
    "--autoLoadProjects",
  },
  -- Env chỉ áp cho tiến trình Roslyn con (không ảnh hưởng nvim cha).
  -- DOTNET_gcServer=0: Workstation GC, ít tốn RAM hơn Server GC mặc định.
  -- DOTNET_GCHeapHardLimit: hex, 100000000 = 4GB (GC heap + bookkeeping).
  cmd_env = {
    DOTNET_gcServer = "0",
    DOTNET_GCHeapHardLimit = "100000000",
  },
  filetypes = { "cs", "razor" }, -- áp dụng cho .cs và .razor
  root_markers = {               -- gốc dự án .NET
    "*.sln",
    "*.slnx",
    "*.csproj",
    ".git",
  },
  -- Chỉ phân tích file đang mở để giảm RAM/CPU solution lớn.
  -- Giữ nguyên inlay hints / codelens (không đụng tới).
  settings = {
    ["csharp|background_analysis"] = {
      dotnet_analyzer_diagnostics_scope = "openFiles",
      dotnet_compiler_diagnostics_scope = "openFiles",
    },
  },
})

-- Bật server; nếu chưa cài, mason-lspconfig tự tải về
vim.lsp.enable("roslyn_ls")
