-- =============================================
--  LUA: Treesitter riêng
--  Lua parser có sẵn trong runtime Neovim, file này
--  chỉ bật highlight + fold + indent khi mở file .lua.
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
