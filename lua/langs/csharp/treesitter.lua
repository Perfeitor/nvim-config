-- =============================================
--  C#: language-specific Treesitter
--  The c_sharp parser is not bundled with the runtime, so
--  install it then enable highlight + fold
-- =============================================
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cs", "razor" },
  callback = function(ev)
    pcall(require("nvim-treesitter").install, { "c_sharp" })
    vim.treesitter.start(ev.buf, "c_sharp")
    vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt_local.foldmethod = "expr"
  end,
})
