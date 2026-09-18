-- =============================================
--  OVERSEER (task runner) — SHARED layer
--  Async build/test/run/watch tasks + task list UI.
--  setup({ dap = true }) patches nvim-dap so `preLaunchTask` /
--  `postDebugTask` are supported: F5 can build asynchronously and only
--  starts the debugger when the build succeeds, without freezing the UI.
--
--  Language-specific tasks do NOT live here: they live on each
--  lua/langs/<name>/ branch (e.g. lua/overseer/template/dotnet.lua),
--  so this file is only edited on main -> merges stay conflict-free.
-- =============================================
require("overseer").setup({
  -- Patch nvim-dap for preLaunchTask / postDebugTask support.
  dap = true,

  output = {
    use_terminal = true,
    preserve_output = false,
  },

  task_list = {
    direction = "bottom",
    min_height = 8,
    max_height = { 20, 0.2 },
  },

  -- Do NOT wrap every vim.system/jobstart call as a task.
  experimental_wrap_builtins = { enabled = false },
})

local map = vim.keymap.set

map("n", "<leader>ot", "<CMD>OverseerToggle<CR>", { desc = "Overseer: Toggle task list" })
-- <leader>oo removed: Toggle already covers Open
map("n", "<leader>or", "<CMD>OverseerRun<CR>", { desc = "Overseer: Run task" })
map("n", "<leader>oa", "<CMD>OverseerTaskAction<CR>", { desc = "Overseer: Task action" })
