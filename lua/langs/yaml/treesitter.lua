-- =============================================
--  YAML: Treesitter riêng
--  Parser yaml không có sẵn trong runtime nên phải cài
--  rồi bật highlight + fold + indent khi mở file .yml/.yaml.
-- =============================================
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "yaml" },
  callback = function(ev)
    pcall(require("nvim-treesitter").install, { "yaml" })
    vim.treesitter.start(ev.buf, "yaml")
    vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt_local.foldmethod = "expr"
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
