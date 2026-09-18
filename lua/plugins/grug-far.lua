-- =============================================
--  GRUG-FAR — project-wide search & replace with preview
-- =============================================
require("grug-far").setup({})

local map = vim.keymap.set

map("n", "<leader>sr", function()
  require("grug-far").open()
end, { desc = "Search & Replace (project)" })

map("n", "<leader>sw", function()
  require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
end, { desc = "Search & Replace word under cursor" })
