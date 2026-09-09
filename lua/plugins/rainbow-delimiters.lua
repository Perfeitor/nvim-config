require("rainbow-delimiters.setup").setup({})

vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#eba0ac" })

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#eba0ac" })
  end,
})
