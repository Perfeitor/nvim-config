-- =============================================
--  MASON-LSPCONFIG (cầu nối Mason <-> Nvim)
--  ensure_installed giữ server của nhóm "mặc định" trên main:
--  lua + các file cấu hình dùng chung (json/yaml/toml/bash/markdown).
--  Server của ngôn ngữ khác được khai báo trong
--  lua/langs/<tên>/lsp.lua và được vim.lsp.enable() tự cài khi cần.
--  (plugins/init.lua nạp plugins.mason TRƯỚC file này.)
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
