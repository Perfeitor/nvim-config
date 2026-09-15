-- =============================================
--  DEFAULT LANGUAGE: LUA   (lives on main)
--  Each language = 1 directory; init.lua only requires child files
--  in order: lsp -> options -> keymaps -> autocmds
-- =============================================
require("langs.lua.treesitter")
require("langs.lua.lsp")
require("langs.lua.options")
require("langs.lua.keymaps")
require("langs.lua.autocmds")
