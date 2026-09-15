-- =============================================
--  TROUBLE (diagnostics / quickfix / loclist)
-- =============================================
require("trouble").setup({
    modes = {
        diagnostics = {
            auto_close = false,
            auto_refresh = true,
        },
    },
})

-- Close Trouble on Nvim exit (avoids leftover processes).
-- Keep THIS AUTOCMD IN THE PLUGIN FILE: if require("trouble") lived in another file
-- (core/autocmds.lua), lua-language-server cannot see the real plugin and mistakes
-- it for lua/plugins/trouble.lua -> reports "same file is required with
-- different names". Keeping it in this file excludes the require -> no warning.
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    pcall(require("trouble").close)
  end,
})
