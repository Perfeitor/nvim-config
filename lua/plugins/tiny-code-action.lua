require("tiny-code-action").setup({
  picker = {
    "buffer",
    opts = {
      position = "cursor",
      winborder = "rounded",
      keymaps = {
        select = "<CR>",
        close = { "q", "<Esc>" },
      },
    },
  },
})
