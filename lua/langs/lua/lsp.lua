-- =============================================
--  LUA: Language Server (lua_ls)
-- =============================================
-- vim.lsp.config() khai báo cấu hình server (nvim 0.11+).
-- vim.lsp.enable() bật server; nếu chưa cài, mason-lspconfig tự tải về.
vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" }, -- lệnh khởi chạy server
  filetypes = { "lua" },           -- áp dụng cho file .lua
  root_markers = {                 -- dấu hiệu nhận diện "gốc dự án"
    ".luarc.json",
    ".luarc.jsonc",
    ".git",
  },
  single_file_support = true,      -- chạy được ngay cả với file đơn lẻ

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },       -- khai báo biến toàn cục "vim" để hết cảnh báo
      },
    },
  },
})

vim.lsp.enable("lua_ls")
