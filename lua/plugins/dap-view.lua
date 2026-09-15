-- =============================================
--  NVIM-DAP-VIEW (debug UI) — SHARED layer
--  UI for nvim-dap: watches/scopes/breakpoints/threads/REPL/console.
--  Shared infrastructure -> lives on main (all lang/* branches inherit it).
--  Language-specific adapters/configs stay in lua/langs/<name>/dap.lua.
-- =============================================
require("dap-view").setup({
  auto_toggle = true,                       -- open on session start, close when done
  winbar = { controls = { enabled = true } },
  virtual_text = { enabled = true, position = "inline" },
})

local map = vim.keymap.set

map("n", "<leader>dv", function() require("dap-view").toggle() end, { desc = "DAP: Toggle view" })
map({ "n", "x" }, "<leader>dw", function() require("dap-view").add_expr() end, { desc = "DAP: Watch expression" })
map({ "n", "x" }, "<leader>dh", function() require("dap-view").hover() end, { desc = "DAP: Hover value" })
