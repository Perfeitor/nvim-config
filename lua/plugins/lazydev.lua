-- =============================================
--  LAZYDEV — better lua_ls while editing this Neovim config
--  Lazily adds workspace libraries based on require() statements.
-- =============================================
require("lazydev").setup({
  library = {
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
  },
})
