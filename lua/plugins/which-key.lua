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
  { "<leader>cf", icon = "󰉢" },      -- format-align-left

  -- Debug
  { "<F5>", icon = "󰐊" },            -- play
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
  { "<leader>or", icon = "󰐊" },      -- play
  { "<leader>oa", icon = "󰇘" },      -- dots-horizontal

  -- Tabs
  { "<leader><Tab>", group = "Tabs" },
  { "<leader><Tab><Left>", icon = "󰜱" },  -- arrow-left-bold
  { "<leader><Tab><Right>", icon = "󰜴" }, -- arrow-right-bold
  { "<leader><Tab><Up>", icon = "󰐕" },    -- plus (new tab)
  { "<leader><Tab><Down>", icon = "󰅖" },  -- close (close tab)

  -- Misc
  { "<leader>q", icon = "󰤀" },       -- playlist-edit
  { "<leader>l", icon = "󰉹" },       -- format-list-bulleted
  { "<leader>cc", icon = "󰁝" },      -- arrow-up
  { "<leader>ct", icon = "󰛼" },      -- page-layout-header
  { "<C-s>", icon = "󰆓" },           -- content-save
  { "<C-a>", icon = "󰒆" },           -- select-all
  { "<leader>e", icon = "󰉋" },       -- folder
  { "<leader>sr", icon = "󰛔" },      -- find-replace
  { "<leader>sw", icon = "󰛔" },
  -- C# (buffer-local, defined on lang/csharp)
  { "<leader>B", icon = "󰝖" },       -- format-list-checks (build)
  { "<leader>dP", icon = "󰑙" },      -- replay (re-select profile/build)
  { "<leader>dA", icon = "󰌹" },      -- link-variant (attach)
})
