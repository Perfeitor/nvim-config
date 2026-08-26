-- =============================================
--  LUA: Option riêng theo ngôn ngữ
-- =============================================
-- Dùng autocmd FileType: khi mở file có ft = "lua" thì áp option buffer-local.
-- Nạp SAU bảng indent dự phòng trong core/options.lua nên ghi đè được.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua" },
  callback = function()
    vim.opt_local.shiftwidth = 2    -- thụt lề 2 space
    vim.opt_local.tabstop = 2
    vim.opt_local.expandtab = true  -- dùng space thay vì tab thật
  end,
})
