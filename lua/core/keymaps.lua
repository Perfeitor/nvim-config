local map = vim.keymap.set
local telescope = require('telescope.builtin')

vim.g.mapleader = " "

local function lsp_jump_to_tab(method)
  local params = vim.lsp.util.make_position_params(0, "utf-16")

  vim.lsp.buf_request(0, "textDocument/" .. method, params, function(err, result)
    if err or not result or vim.tbl_isempty(result) then
      vim.notify("Không tìm thấy", vim.log.levels.INFO)
      return
    end

    local locations = vim.islist(result) and result or { result }

    -- Tạo tab mới
    vim.cmd("tab split")

    -- Nhảy tới kết quả đầu tiên
    vim.lsp.util.jump_to_location(
      locations[1],
      "utf-16",
      true
    )
  end)
end

map("n", "gd", function()
  lsp_jump_to_tab("definition")
end, { desc = "LSP: Go to definition (tab)" })

map("n", "gi", function()
  lsp_jump_to_tab("implementation")
end, { desc = "LSP: Go to implementation (tab)" })

map("n", "gr", vim.lsp.buf.references, { desc = "LSP: References" })
map("n", "K", function()
  vim.lsp.buf.hover({
    border = "rounded",
    max_width = 100,
    max_height = 30,
  })
end, { desc = "LSP: Hover" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: Rename" })
map({ "n", "x" }, "<leader>ca", function()
  require("tiny-code-action").code_action()
end, {
  desc = "Code Action",
})

map("i", "<C-Space>", "<C-X><C-O>")
map("n", "<C-a>", "ggVG", { desc = "Select all" })
map("n", "<leader>e", "<CMD>Neotree toggle reveal<CR>", { desc = "Toggle NeoTree" })
map("i", "<C-S-v>", "<C-r>+", { desc = "Paste clipboard" })
map("n", "<C-S-v>", '"+p', { desc = "Paste clipboard" })
map({ "n", "i" }, "<C-s>", function()
  vim.cmd("stopinsert")
  vim.cmd("write")
  vim.defer_fn(function()
    vim.diagnostic.open_float(nil, {
      focus = false,
      scope = "line",
      border = "rounded"
    })
  end, 100)
end, { desc = "Save & Validate" })

map('n', '<leader>ff', telescope.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fg', telescope.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', telescope.buffers, { desc = 'Telescope buffers' })
map('n', '<leader>fh', telescope.help_tags, { desc = 'Telescope help tags' })

map("i", "<C-h>", vim.lsp.buf.signature_help, { desc = "Signature Help" })

map("n", "<leader>fd", vim.lsp.buf.format)
map("v", "<leader>fd", vim.lsp.buf.format)

map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics" })
map("n", "<C-w>T", "<cmd>tab split<CR>")
