-- =============================================
--  NVIM-DAP (Debug Adapter Protocol) — SHARED layer
--  Infrastructure only: signs + generic keymaps.
--  Adapters & configurations do NOT live here: they belong to each
--  language, under lua/langs/<name>/dap.lua
--  (e.g. netcoredbg for C# on the lang/csharp branch).
--  So this file is only edited on main -> merges stay conflict-free.
-- =============================================
local dap = require("dap")

-- ---- Signs (gutter markers) ----
vim.fn.sign_define("DapBreakpoint",          { text = "●", texthl = "DiagnosticError" })
vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticWarn" })
vim.fn.sign_define("DapLogPoint",            { text = "◆", texthl = "DiagnosticInfo" })
vim.fn.sign_define("DapStopped",             { text = "▶", texthl = "DiagnosticInfo", linehl = "Visual" })
vim.fn.sign_define("DapBreakpointRejected",  { text = "⊘", texthl = "DiagnosticError" })

-- ---- Generic keymaps ----
local map = vim.keymap.set

map("n", "<F5>",  dap.continue,  { desc = "DAP: Run/Continue" })
map("n", "<F10>", dap.step_over, { desc = "DAP: Step over" })
map("n", "<F11>", dap.step_into, { desc = "DAP: Step into" })
map("n", "<F12>", dap.step_out,  { desc = "DAP: Step out" })

map("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle breakpoint" })
map("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP: Conditional breakpoint" })
map("n", "<leader>dc", dap.continue,    { desc = "DAP: Continue" })
map("n", "<leader>dt", dap.terminate,   { desc = "DAP: Terminate" })
map("n", "<leader>dr", dap.repl.toggle, { desc = "DAP: REPL" })
map("n", "<leader>dl", dap.run_last,    { desc = "DAP: Run last" })
