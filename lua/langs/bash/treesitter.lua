-- =============================================
--  BASH: language-specific Treesitter
--  The bash parser is not bundled with the runtime, so install it
--  then enable highlight + fold + indent when opening shell files.
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
