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
  }
})
