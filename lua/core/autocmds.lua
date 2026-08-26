-- =============================================
--  AUTOCMD DÙNG CHUNG
--  (Autocmd riêng của từng ngôn ngữ nằm trong
--   lua/langs/<tên>/autocmds.lua)
-- =============================================

-- Đóng Trouble khi thoát Nvim (tránh lỗi tiến trình còn chạy)
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    pcall(require("trouble").close)
  end,
})

-- MiniStarter: sau khi mở, tự nhảy xuống mục đầu tiên
vim.api.nvim_create_autocmd("User", {
  pattern = "MiniStarterOpened",
  callback = function()
    vim.schedule(function()
      local starter = require("mini.starter")
      starter.update_current_item("next")
    end)
  end,
})

-- Cập nhật tiêu đề cửa sổ theo tên thư mục gốc
vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
  callback = function()
    local root = vim.fn.getcwd()
    vim.opt.titlestring = "Nvim: " .. vim.fn.fnamemodify(root, ":t")
  end,
})
