-- =============================================
--  LUA: language-specific Treesitter
--  The lua parser ships with the Neovim runtime; this file only
--  enables highlight + fold + indent when opening .lua files.
-- =============================================
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua" },
  callback = function(ev)
    vim.treesitter.start(ev.buf, "lua")
    vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt_local.foldmethod = "expr"
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
