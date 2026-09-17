-- =============================================
--  MASON-LSPCONFIG (Mason <-> Nvim bridge)
--  ensure_installed keeps the "default" server set on main:
--  lua + shared config files (json/yaml/toml/bash/markdown).
--  Other languages declare their servers in
--  lua/langs/<name>/lsp.lua and vim.lsp.enable() installs them as needed.
--  (plugins/init.lua loads plugins.mason BEFORE this file.)
--
--  automatic_enable = false:
--  main must NOT auto-enable any mason server. Each lua/langs/<name>/lsp.lua
--  calls vim.lsp.enable() explicitly, so shared servers still work while
--  language servers (e.g. roslyn_ls) only start on their own branch with
--  their own memory-limited config.
-- =============================================
require("mason-lspconfig").setup {
  automatic_enable = false,
  ensure_installed = {
    "lua_ls",
    "jsonls",
    "yamlls",
    "taplo",
    "bashls",
    "marksman",
  },
}
