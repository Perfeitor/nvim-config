-- =============================================
--  NVIM-NOTIFY — SHARED layer
--  Replaces `vim.notify` globally so notifications render as floating
--  toasts instead of a short-lived command-line echo. This matters here
--  because `cmdheight=0` (see lua/plugins/lualine.lua) makes the default
--  echo easy to miss.
--
--  It also acts as the backend for overseer's `on_output_notify`
--  component, which shows live task output (e.g. "RUNNING dotnet build").
-- =============================================
local notify = require("notify")

notify.setup({
  background_colour = "#1d1f21", -- tomorrow_night background
  timeout = 3000,
  max_width = 60,
  stages = "fade_in_slide_out",
})

-- Route every vim.notify() through nvim-notify.
vim.notify = notify
