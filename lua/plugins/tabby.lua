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
      -- Tab bar head
      {
        { "  ", hl = theme.head },
        line.sep("", theme.head, theme.fill),
      },

      -- Show only tabpages, no windows/buffers
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

      -- Push the rest to the right
      line.spacer(),

      -- Trailing section
      {
        { " + ", hl = theme.tab },
        hl = theme.fill,
      },
    }
  end,
})
