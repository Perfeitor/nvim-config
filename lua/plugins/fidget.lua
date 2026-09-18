-- =============================================
--  FIDGET — LSP progress indicator (bottom-right)
--  Shows indexing/loading progress (useful for big solutions).
--  Do NOT override vim.notify here: nvim-notify already handles that.
-- =============================================
require("fidget").setup({
  progress = {
    display = {
      render_limit = 8,
    },
  },
  notification = {
    override_vim_notify = false,
  },
})
