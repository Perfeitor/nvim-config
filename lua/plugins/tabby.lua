vim.o.showtabline = 2

local theme = {
  fill = "TabLineFill",
  head = "TabLine",
  current_tab = "TabLineSel",
  tab = "TabLine",
}

require("tabby").setup({
  line = function(line)
    return {
      -- Đầu thanh tab
      {
        { "  ", hl = theme.head },
        line.sep("", theme.head, theme.fill),
      },

      -- Chỉ hiện tabpage, không hiện window/buffer
      line.tabs().foreach(function(tab)
        local hl = tab.is_current()
            and theme.current_tab
            or theme.tab

        local win = tab.current_win()

        return {
          line.sep("", hl, theme.fill),

          tab.number(),
          " ",

          win.file_icon(),
          tab.name(),
          " ",

          tab.close_btn("×"),

          line.sep("", hl, theme.fill),

          hl = hl,
          margin = " ",
        }
      end),

      -- Đẩy phần còn lại sang phải
      line.spacer(),

      -- Phần cuối
      {
        { " + ", hl = theme.tab },
        hl = theme.fill,
      },
    }
  end,
})
