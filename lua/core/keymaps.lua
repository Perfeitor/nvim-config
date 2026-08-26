local map = vim.keymap.set
local telescope = require('telescope.builtin')

vim.g.mapleader = " "

map("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "LSP: References" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "LSP: Go to implementation" })
map("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: Rename" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code action" })

map("i", "<C-Space>", "<C-X><C-O>")
map({ "n", "i" }, "<C-s>", "<cmd>write<cr>", { desc = "Save" })
map("n", "<C-a>", "ggVG", { desc = "Select all" })
map("n", "<leader>e", "<CMD>Neotree toggle reveal<CR>", { desc = "Toggle NeoTree" })
map("i", "<C-S-v>", "<C-r>+", { desc = "Paste clipboard" })
map("n", "<C-S-v>", '"+p', { desc = "Paste clipboard" })

map('n', '<leader>ff', telescope.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fg', telescope.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', telescope.buffers, { desc = 'Telescope buffers' })
map('n', '<leader>fh', telescope.help_tags, { desc = 'Telescope help tags' })

map("i", "<C-h>", vim.lsp.buf.signature_help, { desc = "Signature Help" })

map("n", "<leader>fd", vim.lsp.buf.format)
map("v", "<leader>fd", vim.lsp.buf.format)

map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics" })
