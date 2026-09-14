-- =============================================
--  TOML: Treesitter riêng
--  Parser toml không có sẵn trong runtime nên phải cài
--  rồi bật highlight + fold + indent khi mở file .toml.
-- =============================================
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "toml" },
  callback = function(ev)
    pcall(require("nvim-treesitter").install, { "toml" })
    vim.treesitter.start(ev.buf, "toml")
    vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt_local.foldmethod = "expr"
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
