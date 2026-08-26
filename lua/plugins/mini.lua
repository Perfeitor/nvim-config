-- =============================================
--  MINI.STARTER (màn hình khởi động)
-- =============================================
require("mini.starter").setup({
  items = {
    {
      name = "Recent files",
      action = "lua MiniStarter.open()",
      section = "Recent",
    },
    require("mini.starter").sections.recent_files(10, true, true),
    require("mini.starter").sections.builtin_actions(),
  },
})

-- Sau khi mở, tự nhảy xuống mục đầu tiên (quirk của mini.starter)
vim.api.nvim_create_autocmd("User", {
  pattern = "MiniStarterOpened",
  callback = function()
    vim.schedule(function()
      local starter = require("mini.starter")
      starter.update_current_item("next")
    end)
  end,
})
