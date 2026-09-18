-- =============================================
--  WHICH-KEY — keymap hints popup
--  Reads `desc` from vim.keymap.set, and ships built-in presets
--  (operators, motions, text objects, <C-w>, z, g, marks, registers,
--  spelling). Buffer-local keymaps are shown when in that buffer.
-- =============================================
require("which-key").setup({
  preset = "classic",
  delay = 300,
  icons = {
    keys = {
      -- Default is U+F006E "󰁮", which some Nerd Font builds (including
      -- JetBrainsMono Nerd Font) render 2 cells wide while Neovim counts
      -- it as 1 -> the highlight only covers half the glyph. Use the
      -- single-width backspace symbol instead.
      BS = "⌫",
    },
  },
})

-- Describe <leader> groups so the popup is organised.
require("which-key").add({
  { "<leader>", group = "Leader" },
  { "<leader>f", group = "Find/File" },
  { "<leader>d", group = "Debug" },
  { "<leader>o", group = "Overseer" },
  { "<leader>s", group = "Search/Replace" },
  { "<leader>x", group = "Diagnostics" },
  { "<leader>r", group = "Rename" },
  { "<leader>c", group = "Code" },
  { "g", group = "Goto" },
  { "[", group = "Prev" },
  { "]", group = "Next" },
  { "z", group = "Folds/Spelling" },
})
