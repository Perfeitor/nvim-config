-- =============================================
--  LUA: Language Server (lua_ls)
-- =============================================
-- vim.lsp.config() declares the server config (nvim 0.11+).
-- vim.lsp.enable() enables the server; if missing, mason-lspconfig installs it.
vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" }, -- server launch command
  filetypes = { "lua" },           -- applies to .lua files
  root_markers = {                 -- project-root markers
    ".luarc.json",
    ".luarc.jsonc",
    ".git",
  },
  single_file_support = true,      -- works even with single files

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },       -- declare global "vim" to silence warnings
      },
    },
  },
})

vim.lsp.enable("lua_ls")
