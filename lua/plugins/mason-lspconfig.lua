-- =============================================
--  MASON-LSPCONFIG (Mason <-> Nvim bridge)
--  ensure_installed keeps the "default" server set on main:
--  lua + shared config files (json/yaml/toml/bash/markdown).
--  Other languages declare their servers in
--  lua/langs/<name>/lsp.lua and vim.lsp.enable() installs them as needed.
--  (plugins/init.lua loads plugins.mason BEFORE this file.)
-- =============================================
require("mason-lspconfig").setup {
  ensure_installed = {
    "lua_ls",
    "jsonls",
    "yamlls",
    "taplo",
    "bashls",
    "marksman",
  },
}
