-- =============================================
--  BASH: Treesitter riêng
--  Parser bash không có sẵn trong runtime nên phải cài
--  rồi bật highlight + fold + indent khi mở file shell.
-- =============================================
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "sh", "bash", "zsh" },
  callback = function(ev)
    pcall(require("nvim-treesitter").install, { "bash" })
    vim.treesitter.start(ev.buf, "bash")
    vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt_local.foldmethod = "expr"
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
