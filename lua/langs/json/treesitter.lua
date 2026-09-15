-- =============================================
--  JSON: language-specific Treesitter
--  The json parser is not bundled with the runtime, so install it then
--  enable highlight + fold + indent for .json/.jsonc files
--  (jsonc shares the json parser).
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
