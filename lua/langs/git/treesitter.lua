-- =============================================
--  GIT: language-specific Treesitter
--  No LSP needed. Parsers are not bundled with the runtime, so install
--  them then enable highlight + fold for commit messages / diffs / ignores.
--  Note: filetype and parser names do not always match.
-- =============================================
local parsers = {
  gitcommit = "gitcommit",
  gitrebase = "git_rebase",
  gitconfig = "git_config",
  gitignore = "gitignore",
  gitattributes = "gitattributes",
  diff = "diff",
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = vim.tbl_keys(parsers),
  callback = function(ev)
    local parser = parsers[ev.match]
    pcall(require("nvim-treesitter").install, { parser })
    if pcall(vim.treesitter.start, ev.buf, parser) then
      vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.opt_local.foldmethod = "expr"
    end
  end,
})
