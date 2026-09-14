-- =============================================
--  MARKDOWN: Treesitter riêng
--  Parser markdown + markdown_inline có sẵn trong runtime Neovim
--  nên chỉ bật highlight + fold khi mở file markdown.
-- =============================================
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function(ev)
    vim.treesitter.start(ev.buf, "markdown")
    vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt_local.foldmethod = "expr"
  end,
})
