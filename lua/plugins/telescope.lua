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

-- fzf-native sorter (built by the PackChanged hook in core/pack.lua).
pcall(require("telescope").load_extension, "fzf")
