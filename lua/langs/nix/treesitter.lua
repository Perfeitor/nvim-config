vim.api.nvim_create_autocmd("FileType", {
  pattern = { "nix" },
  callback = function(ev)
    pcall(require("nvim-treesitter").install, { "nix" })
    vim.treesitter.start(ev.buf, "nix")
    vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt_local.foldmethod = "expr"
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
