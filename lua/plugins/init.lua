-- =============================================
--  LOADER PLUGIN
--  Tự quét và nạp mọi file .lua trong lua/plugins/
--  (trừ chính file init.lua). Thêm plugin config =
--  thêm 1 file, không cần sửa danh sách -> không conflict khi merge.
-- =============================================
local dir = vim.fn.stdpath("config") .. "/lua/plugins"

for _, file in ipairs(vim.fn.glob(dir .. "/*.lua", false, true)) do
  local name = vim.fn.fnamemodify(file, ":t:r")
  if name ~= "init" then
    require("plugins." .. name)
  end
end
