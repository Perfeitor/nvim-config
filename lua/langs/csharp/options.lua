-- =============================================
--  C#: Option riêng theo ngôn ngữ
-- =============================================

-- ---- Khối 1: Indent 4 space cho C# ----
-- Ghi đè bảng indent dự phòng trong core/options.lua
-- (nạp sau nên thắng).
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cs", "razor" },
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.expandtab = true
  end,
})

-- ---- Khối 2: Highlight màu riêng cho C# ----
-- Điều chỉnh màu semantic token để phân biệt rõ
-- class / method / member thay vì màu mặc định.
vim.api.nvim_set_hl(0, "@lsp.type.field.cs", { fg = "#63bdb5" })
vim.api.nvim_set_hl(0, "@csharp.variable", { fg = "#61AFEF" })
vim.api.nvim_set_hl(0, "@csharp.member", { fg = "#E5C07B" })
vim.api.nvim_set_hl(0, "@csharp.method", { fg = "#C678DD" })
vim.api.nvim_set_hl(0, "@csharp.class", { fg = "#4c9b8a" })
vim.api.nvim_set_hl(0, "@lsp.type.controlKeyword.cs", { fg = "#c688c0" })
vim.api.nvim_set_hl(0, "@lsp.type.keyword.cs", { fg = "#5b9bd5" })
