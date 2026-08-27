-- =============================================
--  OPTION DÙNG CHUNG (cho mọi ngôn ngữ)
-- =============================================
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = true
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes:1"
vim.opt.numberwidth = 4
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.confirm = true
vim.opt.list = true
vim.opt.termguicolors = true
vim.opt.title = true

-- =============================================
--  BẢNG INDENT DỰ PHÒNG
--  Fallback cho ngôn ngữ CHƯA có thư mục riêng trong lua/langs/.
--  Ngôn ngữ đã có thư mục riêng (lua, csharp) tự quản indent
--  trong lua/langs/<tên>/options.lua và nạp SAU nên thắng bảng này.
-- =============================================
local indent = {
  -- 4 spaces
  java = 4,
  python = 4,
  rust = 4,
  cpp = 4,
  c = 4,
  php = 4,

  -- 2 spaces
  ruby = 2,
  javascript = 2,
  javascriptreact = 2,
  typescript = 2,
  typescriptreact = 2,
  json = 2,
  jsonc = 2,
  yaml = 2,
  html = 2,
  css = 2,
  scss = 2,

  -- Go dùng Tab thật, đây chỉ là giá trị giả
  go = 4,
}

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    local ft = vim.bo.filetype
    local width = indent[ft]

    if not width then
      return
    end

    vim.opt_local.shiftwidth = width
    vim.opt_local.tabstop = width
    vim.opt_local.expandtab = ft ~= "go"
  end,
})

-- =============================================
--  DIAGNOSTIC (bong bóng lỗi của LSP)
-- =============================================
vim.diagnostic.config({
  float = {
    focus = false,
    scope = "cursor",
  },
  jump = { on_jump = vim.diagnostic.open_float },
  signs = {
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
      [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
    },
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅙",
      [vim.diagnostic.severity.HINT] = "󰌵",
      [vim.diagnostic.severity.INFO] = "󰋼",
      [vim.diagnostic.severity.WARN] = "󰀦",
    },
  },
  update_in_insert = true,
  virtual_text = true,
})

-- Tắt codelens (nút "refactor/run" hiện ngay trên code)
vim.lsp.codelens.enable(false)

-- =============================================
--  FOLD BẰNG TREESITTER (gấp/xem cấu trúc code)
-- =============================================
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "1"
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
}

-- =============================================
--  COLORSCHEME
--  (Highlight màu riêng của C# đã chuyển sang
--   lua/langs/csharp/options.lua)
-- =============================================
vim.cmd("colorscheme kanagawa-wave")

-- =============================================
--  MÀU DIAGNOSTIC RÕ RÀNG (bảng màu One Dark, dịu mắt)
--  Áp dụng sau colorscheme để ghi đè theme.
--  Đồng bộ: icon (Sign), text gốc (VirtualText link theo),
--  bong bóng float, header float, màu undercurl.
-- =============================================
local diag_colors = {
  Error = "#E06C75", -- đỏ hồng nhẹ (dịu hơn #E82424)
  Warn  = "#E5C07B", -- vàng hổ phách
  Info  = "#61AFEF", -- xanh dương
  Hint  = "#98C379", -- xanh lá
}
for sev, fg in pairs(diag_colors) do
  vim.api.nvim_set_hl(0, "Diagnostic" .. sev, { fg = fg })
  vim.api.nvim_set_hl(0, "DiagnosticSign" .. sev, { fg = fg, bg = "none" })
  vim.api.nvim_set_hl(0, "DiagnosticFloating" .. sev, { fg = fg })
  vim.api.nvim_set_hl(0, "DiagnosticFloatingHeader" .. sev, { fg = fg })
  local u = vim.api.nvim_get_hl(0, { name = "DiagnosticUnderline" .. sev, link = false })
  u.sp = fg
  vim.api.nvim_set_hl(0, "DiagnosticUnderline" .. sev, u)
end

