-- Điểm khởi động config.
-- Thứ tự: các phần DÙNG CHUNG nạp trước, các NGÔN NGỮ nạp CUỐI CÙNG
-- để cấu hình ngôn ngữ ghi đè được mặc định chung.
require("core.pack")          -- 1. Đăng ký plugin dùng chung
require("core.keymaps")       -- 2. Phím tắt dùng chung
require("core.options")       -- 3. Option dùng chung
require("core.autocmds")      -- 4. Autocmd dùng chung
require("core.langs")         -- 5. Nạp từng ngôn ngữ (quét lua/langs/*)
