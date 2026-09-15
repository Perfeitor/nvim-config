-- =============================================
--  NVIM-DAP (Debug Adapter Protocol) — lớp DÙNG CHUNG
--  Chỉ chứa hạ tầng: signs + phím tắt generic.
--  Adapter & configurations KHÔNG nằm ở đây: chúng thuộc
--  từng ngôn ngữ, đặt trong lua/langs/<tên>/dap.lua
--  (vd: netcoredbg cho C# ở nhánh lang/csharp).
--  Vì vậy file này chỉ bị sửa trên main -> merge không conflict.
-- =============================================
local dap = require("dap")

-- ---- Signs (dấu hiển thị ở cột gutter) ----
vim.fn.sign_define("DapBreakpoint",          { text = "●", texthl = "DiagnosticError" })
vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticWarn" })
vim.fn.sign_define("DapLogPoint",            { text = "◆", texthl = "DiagnosticInfo" })
vim.fn.sign_define("DapStopped",             { text = "▶", texthl = "DiagnosticInfo", linehl = "Visual" })
vim.fn.sign_define("DapBreakpointRejected",  { text = "⊘", texthl = "DiagnosticError" })

-- ---- Phím tắt generic ----
local map = vim.keymap.set

map("n", "<F5>",  dap.continue,  { desc = "DAP: Chạy/Tiếp tục" })
map("n", "<F10>", dap.step_over, { desc = "DAP: Bước qua" })
map("n", "<F11>", dap.step_into, { desc = "DAP: Bước vào" })
map("n", "<F12>", dap.step_out,  { desc = "DAP: Bước ra" })

map("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Bật/tắt breakpoint" })
map("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input("Điều kiện breakpoint: "))
end, { desc = "DAP: Breakpoint có điều kiện" })
map("n", "<leader>dc", dap.continue,    { desc = "DAP: Continue" })
map("n", "<leader>dt", dap.terminate,   { desc = "DAP: Terminate" })
map("n", "<leader>dr", dap.repl.toggle, { desc = "DAP: REPL" })
map("n", "<leader>dl", dap.run_last,    { desc = "DAP: Chạy lại lần cuối" })
