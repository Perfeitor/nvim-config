-- =============================================
--  STICKY CONTEXT (biết đang edit hàm nào)
--  Dính tối đa vài dòng scope (Class > Method) trên đỉnh
--  buffer khi con trỏ lọt vào trong hàm/class.
--  Dùng parser treesitter mà từng ngôn ngữ đã bật trong
--  lua/langs/<tên>/treesitter.lua.
-- =============================================
require("treesitter-context").setup({
  enable = true,
  max_lines = 0,
  trim_scope = "inner",
  mode = "cursor",        -- bám theo con trỏ -> đúng hàm đang edit
  separator = "-",
  multiline_threshold = 20,
  min_window_height = 0,
})
vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { desc = "Context: nhảy lên scope cha" })
vim.keymap.set("n", "<leader>ct", function()
  require("treesitter-context").toggle()
end, { desc = "Context: bật/tắt sticky header" })
