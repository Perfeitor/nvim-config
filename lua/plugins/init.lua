-- =============================================
--  LOADER PLUGIN DÙNG CHUNG
--  Nạp các plugin dùng chung theo THỨ TỰ tường minh
--  (một số plugin phụ thuộc thứ tự, vd: mason phải setup
--   trước mason-lspconfig).
--
--  Plugin riêng của từng ngôn ngữ KHÔNG nằm ở đây:
--  chúng sống trong lua/langs/<tên>/ và được nạp qua core/langs.
--  Vì vậy file này chỉ bị sửa trên main, không bao giờ bị các
--  nhánh ngôn ngữ đụng tới -> merge vẫn không conflict.
-- =============================================
require("plugins.mason")
require("plugins.telescope")
require("plugins.neotree")
require("plugins.mason-lspconfig")
require("plugins.gitsigns")
require("plugins.blink")
require("plugins.autopairs")
require("plugins.rainbow-delimiters")
require("plugins.scrollview")
require("plugins.trouble")
require("plugins.lensline")
require("plugins.lualine")
require("plugins.quicker")
require("plugins.mini")
require("plugins.dropbar")
require("plugins.indent-blankline")
