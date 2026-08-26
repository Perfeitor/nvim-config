require("dropbar").setup({
  bar = {
    sources = function()
      local sources = require("dropbar.sources")
      local utils = require("dropbar.utils")

      return {
        sources.path,
        utils.source.fallback({
          sources.lsp,
          sources.treesitter,
        }),
      }
    end,
  },

  sources = {
    path = {
      max_depth = 16,
    },

    lsp = {
      max_depth = 1,
      valid_symbols = {
        "Class",
        "Method",
      },
    },

    treesitter = {
      max_depth = 2,
      valid_types = {
        "class",
        "method",
      },
    },
  },
})
