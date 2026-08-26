-- =============================================
--  MASON-LSPCONFIG (cầu nối Mason <-> Nvim)
--  ensure_installed chỉ giữ server của ngôn ngữ mặc định (lua).
--  Server của ngôn ngữ khác được khai báo trong
--  lua/langs/<tên>/lsp.lua và được vim.lsp.enable() tự cài khi cần.
-- =============================================
require("mason-lspconfig").setup {
  ensure_installed = {
    "lua_ls",
  },
}
