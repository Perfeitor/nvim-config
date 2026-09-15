-- =============================================
--  YAML: language-specific Treesitter
--  The yaml parser is not bundled with the runtime, so install it
--  then enable highlight + fold + indent for .yml/.yaml files.
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
