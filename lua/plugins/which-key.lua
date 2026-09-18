-- =============================================
--  WHICH-KEY — keymap hints popup
--  Reads `desc` from vim.keymap.set, and ships built-in presets
--  (operators, motions, text objects, <C-w>, z, g, marks, registers,
--  spelling). Buffer-local keymaps are shown when in that buffer.
-- =============================================
require("which-key").setup({
  preset = "classic",
  delay = 300,
})

-- Describe <leader> groups so the popup is organised.
require("which-key").add({
  { "<leader>f", group = "Find/File" },
  { "<leader>d", group = "Debug" },
  { "<leader>o", group = "Overseer" },
  { "<leader>s", group = "Search/Replace" },
  { "<leader>x", group = "Diagnostics" },
})
