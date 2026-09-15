-- =============================================
--  TOML: language-specific Treesitter
--  The toml parser is not bundled with the runtime, so install it
--  then enable highlight + fold + indent for .toml files.
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
