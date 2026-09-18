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
      -- Original Nerd Font backspace glyph. Requires the
      -- "... Nerd Font Mono" variant so it renders single-width.
      BS = "󰁮",
    },
  },
})

-- Menus (groups) with icons.
require("which-key").add({
  { "<leader>", group = "Leader", icon = "󰌆" },          -- key
  { "<leader>f", group = "Find/File", icon = "󰈞" },      -- file-find
  { "<leader>d", group = "Debug", icon = "󰃤" },          -- bug
  { "<leader>o", group = "Overseer", icon = "󰝖" },       -- format-list-checks
  { "<leader>s", group = "Search/Replace", icon = "󰛔" }, -- find-replace
  { "<leader>x", group = "Diagnostics", icon = "󰓙" },    -- stethoscope
  { "<leader>r", group = "Rename", icon = "󰑕" },         -- rename-box
  { "<leader>c", group = "Code", icon = "󰅴" },           -- code-tags
  { "g", group = "Goto", icon = "󰇐" },                   -- directions
  { "[", group = "Prev", icon = "󰜱" },                   -- arrow-left-bold
  { "]", group = "Next", icon = "󰜴" },                   -- arrow-right-bold
  { "z", group = "Folds/Spelling", icon = "󰉋" },        -- folder
})

-- Per-keymap icons (entries that don't match which-key's built-in rules).
require("which-key").add({
  -- LSP
  { "gd", icon = "󰓾" },              -- target
  { "gD", icon = "󰓾" },
  { "gi", icon = "󰜴" },              -- arrow-right-bold
  { "gI", icon = "󰜴" },
  { "gr", icon = "󰌹" },              -- link-variant
  { "K", icon = "󰋽" },               -- information-outline
  { "<leader>rn", icon = "󰑕" },      -- rename-box
  { "<leader>ca", icon = "󰌵" },      -- lightbulb
  { "<leader>fd", icon = "󰉢" },      -- format-align-left

  -- Debug
  { "<F5>", icon = "󰐊" },            -- play
  { "<leader>dc", icon = "󰐊" },
  { "<F10>", icon = "󰆷" },           -- debug-step-over
  { "<F11>", icon = "󰆹" },           -- debug-step-into
  { "<F12>", icon = "󰆸" },           -- debug-step-out
  { "<leader>db", icon = "󰝦" },      -- circle-outline
  { "<leader>dB", icon = "󰻂" },      -- record-circle
  { "<leader>dt", icon = "󰓛" },      -- stop
  { "<leader>dr", icon = "󰆍" },      -- console
  { "<leader>dl", icon = "󰑙" },      -- replay
  { "<leader>dv", icon = "󰈈" },      -- eye
  { "<leader>dw", icon = "󰛐" },      -- eye-outline
  { "<leader>dh", icon = "󰆆" },      -- comment-question-outline

  -- Overseer
  { "<leader>ot", icon = "󰝖" },      -- format-list-checks
  { "<leader>oo", icon = "󰏌" },      -- open-in-new
  { "<leader>or", icon = "󰐊" },      -- play
  { "<leader>oa", icon = "󰇘" },      -- dots-horizontal

  -- Misc
  { "<leader>q", icon = "󰤀" },       -- playlist-edit
  { "<leader>l", icon = "󰉹" },       -- format-list-bulleted
  { "[c", icon = "󰁝" },              -- arrow-up
  { "<leader>ct", icon = "󰛼" },      -- page-layout-header
  { "<C-s>", icon = "󰆓" },           -- content-save
  { "<C-a>", icon = "󰒆" },           -- select-all
  { "<C-Space>", mode = "i", icon = "󰁨" }, -- auto-fix
  { "<leader>e", icon = "󰉋" },       -- folder
  { "<leader>sr", icon = "󰛔" },      -- find-replace
  { "<leader>sw", icon = "󰛔" },
})
