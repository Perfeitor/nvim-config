require("scrollview").setup({
    signs_on_startup = { "diagnostics", "search" },
})

-- Hiển thị git add/change/delete trên scrollbar (gitsigns là contrib, không bật qua signs_on_startup được).
-- Phải gọi SAU gitsigns.setup() (thứ tự trong lua/plugins/init.lua đã đúng).
-- pcall để re-source config không lỗi "group is already registered".
pcall(require("scrollview.contrib.gitsigns").setup, {
    enabled = true,
    hide_full_add = true,
    only_first_line = false,
    add_priority = 90,
    change_priority = 90,
    delete_priority = 90,
})
