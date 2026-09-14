-- =============================================
--  GIT: Treesitter riêng
--  Không cần LSP. Parser không có sẵn trong runtime nên phải cài
--  rồi bật highlight + fold khi mở commit message / diff / ignore.
--  Lưu ý: filetype và tên parser không luôn trùng nhau.
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
