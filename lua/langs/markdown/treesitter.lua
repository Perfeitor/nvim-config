-- =============================================
--  MARKDOWN: language-specific Treesitter
--  The markdown + markdown_inline parsers ship with the Neovim runtime,
--  so only enable highlight + fold for markdown files.
-- =============================================
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function(ev)
    vim.treesitter.start(ev.buf, "markdown")
    vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt_local.foldmethod = "expr"
  end,
})
