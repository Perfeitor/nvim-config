-- =============================================
--  AUTOCMD DÙNG CHUNG
--  (Autocmd riêng của từng ngôn ngữ nằm trong
--   lua/langs/<tên>/autocmds.lua;
--   autocmd gắn với 1 plugin cụ thể nằm trong
--   lua/plugins/<plugin>.lua)
-- =============================================

-- Cập nhật tiêu đề cửa sổ theo tên thư mục gốc
vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
  callback = function()
    local root = vim.fn.getcwd()
    vim.opt.titlestring = "Nvim: " .. vim.fn.fnamemodify(root, ":t")
  end,
})
