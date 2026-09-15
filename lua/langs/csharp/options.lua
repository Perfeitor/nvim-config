-- =============================================
--  C#: language-specific options
-- =============================================

-- ---- Block 1: 4-space indent for C# ----
-- Override the fallback indent table in core/options.lua
-- (loads later, so it wins).
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cs", "razor" },
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.expandtab = true
  end,
})

-- ---- Block 2: C#-specific highlight colors ----
-- Tune semantic token colors to clearly distinguish
-- class / method / member instead of the default colors.
vim.api.nvim_set_hl(0, "@lsp.type.field.cs",          { fg = "#7AA89F" })
vim.api.nvim_set_hl(0, "@csharp.variable",            { fg = "#C0A36E" })
vim.api.nvim_set_hl(0, "@csharp.member",              { fg = "#c4c4c4" })
vim.api.nvim_set_hl(0, "@csharp.method",              { fg = "#7E9CD8" })
vim.api.nvim_set_hl(0, "@csharp.class",               { fg = "#E6C384" })
vim.api.nvim_set_hl(0, "@lsp.type.controlKeyword.cs", { fg = "#FFFFFF" })
vim.api.nvim_set_hl(0, "@lsp.type.keyword.cs",        { fg = "#957FB8" })
vim.api.nvim_set_hl(0, "@lsp.type.keyword.cs", { fg = "#5b9bd5" })
