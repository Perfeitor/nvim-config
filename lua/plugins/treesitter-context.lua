-- =============================================
--  STICKY CONTEXT (know which function is being edited)
--  Pin a few scope lines (Class > Method) at the top of the
--  buffer when the cursor enters a function/class.
--  Uses the treesitter parsers each language enabled in
--  lua/langs/<name>/treesitter.lua.
-- =============================================
require("treesitter-context").setup({
  enable = true,
  max_lines = 0,
  trim_scope = "inner",
  mode = "cursor",        -- follow the cursor -> the function being edited
  separator = "-",
  multiline_threshold = 20,
  min_window_height = 0,
})
-- NOTE: was "[c", changed to free the built-in diff-jump mapping ([c / ]c).
vim.keymap.set("n", "<leader>cc", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { desc = "Context: jump to parent scope" })
vim.keymap.set("n", "<leader>ct", function()
  require("treesitter-context").toggle()
end, { desc = "Context: toggle sticky header" })
