-- =============================================
--  LUA: language-specific options
-- =============================================
-- Use a FileType autocmd: when a file with ft = "lua" opens, apply buffer-local options.
-- Loads AFTER the fallback indent table in core/options.lua, so it overrides it.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua" },
  callback = function()
    vim.opt_local.shiftwidth = 2    -- 2-space indent
    vim.opt_local.tabstop = 2
    vim.opt_local.expandtab = true  -- use spaces instead of real tabs
  end,
})
