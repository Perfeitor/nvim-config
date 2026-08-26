local actions = require("telescope.actions")

require('telescope').setup({
  defaults = { 
    mappings = {
      i = {
        ["<C-y>"] = actions.select_vertical,
      },
      n = {
        ["<C-y>"] = actions.select_vertical,
      }
    }
  },
  extensions = {
    persisted = {
      layout_config = { width = 0.55, height = 0.55 }
    }
  }
})
