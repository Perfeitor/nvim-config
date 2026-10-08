vim.lsp.config("nixd", {
  cmd = { "nixd" },
  filetypes = { "nix" },
  root_markers = { "flake.nix", ".git" },
  single_file_support = true,
  settings = {
    nixd = {
      formatting = { command = { "nixfmt" } },
    },
  },
})

vim.lsp.enable("nixd")
