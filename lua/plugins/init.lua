-- =============================================
--  SHARED PLUGIN LOADER
--  Loads shared plugins in an EXPLICIT order
--  (some plugins are order-dependent, e.g. mason must be set up
--   before mason-lspconfig).
--
--  Language-specific plugins do NOT live here:
--  they live in lua/langs/<name>/ and are loaded via core/langs.
--  So this file is only edited on main; language branches never
--  touch it -> merges stay conflict-free.
-- =============================================
require("plugins.notify")
require("plugins.mason")
require("plugins.telescope")
require("plugins.neotree")
require("plugins.mason-lspconfig")
require("plugins.gitsigns")
require("plugins.blink")
require("plugins.autopairs")
require("plugins.treesitter")
require("plugins.treesitter-context")
require("plugins.rainbow-delimiters")
require("plugins.scrollview")
require("plugins.trouble")
require("plugins.lensline")
require("plugins.lualine")
require("plugins.quicker")
require("plugins.mini")
require("plugins.dropbar")
require("plugins.indent-blankline")
require("plugins.tabby")
require("plugins.dap")
require("plugins.dap-view")
require("plugins.overseer")
