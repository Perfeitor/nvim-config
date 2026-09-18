-- =============================================
--  NVIM-FILE-OPERATIONS (Crysthamus) — LSP workspace file operations
--  Rename/move/create/delete files (e.g. via neo-tree) notifies LSP,
--  which updates imports/usings. Drop-in replacement for
--  antosha417/nvim-lsp-file-operations, which relies on plenary and
--  is reported broken on Neovim 0.12.
--  Works by subscribing to neo-tree events (no load-order requirement).
-- =============================================
require("nvim-file-operations").setup()

-- Advertise workspace.fileOperations support to all LSP clients.
-- vim.lsp/client.lua deep-merges this with the default capabilities.
vim.lsp.config("*", {
  capabilities = require("nvim-file-operations.config").default_capabilities(),
})
