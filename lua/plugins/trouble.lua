-- =============================================
--  TROUBLE (diagnostics / quickfix / loclist)
-- =============================================
require("trouble").setup({
    modes = {
        diagnostics = {
            auto_close = false,
            auto_refresh = true,
        },
    },
})

-- Đóng Trouble khi thoát Nvim (tránh lỗi tiến trình còn chạy).
-- Để AUTOCMD NÀY TRONG FILE PLUGIN: nếu require("trouble") nằm ở file khác
-- (core/autocmds.lua), lua-language-server không thấy plugin thật nên hiểu nhầm
-- nó trỏ tới lua/plugins/trouble.lua -> báo "same file is required with
-- different names". Để cùng file này, require tự bị loại trừ -> hết cảnh báo.
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    pcall(require("trouble").close)
  end,
})
