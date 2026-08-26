-- =============================================
--  NGÔN NGỮ MẶC ĐỊNH: LUA   (nằm trên main)
--  Mỗi ngôn ngữ = 1 thư mục; init.lua chỉ require các file con
--  theo thứ tự: lsp -> options -> keymaps -> autocmds
-- =============================================
require("langs.lua.lsp")
require("langs.lua.options")
require("langs.lua.keymaps")
require("langs.lua.autocmds")
