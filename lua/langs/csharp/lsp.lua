-- =============================================
--  C#: Language Server (roslyn_ls)
-- =============================================
vim.lsp.config("roslyn_ls", {
  cmd = {
    "roslyn-language-server",
    "--stdio",
    "--autoLoadProjects",
  },
  -- Env applies only to the child Roslyn process (not the parent nvim).
  -- DOTNET_gcServer=0: Workstation GC, uses less RAM than default Server GC.
  -- DOTNET_GCHeapHardLimit: hex, 100000000 = 4GB (GC heap + bookkeeping).
  cmd_env = {
    DOTNET_gcServer = "0",
    DOTNET_GCHeapHardLimit = "100000000",
  },
  filetypes = { "cs", "razor" }, -- applies to .cs and .razor
  root_markers = {               -- .NET project roots
    "*.sln",
    "*.slnx",
    "*.csproj",
    ".git",
  },
  -- Only analyze open files to save RAM/CPU on large solutions.
  -- Leave inlay hints / codelens untouched.
  settings = {
    ["csharp|background_analysis"] = {
      dotnet_analyzer_diagnostics_scope = "openFiles",
      dotnet_compiler_diagnostics_scope = "openFiles",
    },
  },
})

-- Enable the server; if missing, mason-lspconfig installs it
vim.lsp.enable("roslyn_ls")
