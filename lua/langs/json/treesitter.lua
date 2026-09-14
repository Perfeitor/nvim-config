-- =============================================
--  JSON: Treesitter riêng
--  Parser json không có sẵn trong runtime nên phải cài rồi bật
--  highlight + fold + indent khi mở file .json/.jsonc
--  (jsonc dùng chung parser json).
-- =============================================
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc" },
  callback = function(ev)
    pcall(require("nvim-treesitter").install, { "json" })
    vim.treesitter.start(ev.buf, "json")
    vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt_local.foldmethod = "expr"
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
