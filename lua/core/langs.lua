-- =============================================
--  LOADER NGÔN NGỮ
--  Quét MỌI thư mục con trong lua/langs/ và gọi require("langs.<tên>").
--  Mỗi thư mục = 1 ngôn ngữ, có init.lua làm điểm vào.
--
--  Vì sao thiết kế này không bao giờ conflict khi merge?
--  - Thêm ngôn ngữ mới = chỉ THÊM 1 thư mục, không sửa file dùng chung.
--  - Git merge chỉ xung đột khi 2 nhánh sửa cùng dòng cùng file.
--    Ở đây không nhánh nào sửa file này -> merge n nhánh luôn sạch.
-- =============================================
local langs_dir = vim.fn.stdpath("config") .. "/lua/langs"

for _, entry in ipairs(vim.fn.glob(langs_dir .. "/*", false, true)) do
  if vim.fn.isdirectory(entry) == 1 then -- chỉ nhận thư mục
    local name = vim.fn.fnamemodify(entry, ":t")
    require("langs." .. name)
  end
end
