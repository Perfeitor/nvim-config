-- =============================================
--  C#: Treesitter riêng
--  Parser c_sharp không có sẵn trong runtime nên
--  phải cài đặt rồi bật highlight + fold + indent
--  khi mở file .cs / .razor.
-- =============================================
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cs", "razor" },
  callback = function(ev)
    pcall(require("nvim-treesitter").install, { "c_sharp" })
    vim.treesitter.start(ev.buf, "c_sharp")
    vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt_local.foldmethod = "expr"
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
