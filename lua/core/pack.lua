vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter.git",
  "https://github.com/nvim-telescope/telescope.nvim.git",
  "https://github.com/mason-org/mason.nvim",

  -- Neotree and Dependencies
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = vim.version.range('3')
  },
  -- dependencies
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  -- optional, but recommended
  "https://github.com/nvim-tree/nvim-web-devicons",

  "https://github.com/mason-org/mason-lspconfig.nvim.git",
  "https://github.com/lewis6991/gitsigns.nvim.git",

  "https://github.com/saghen/blink.lib.git",
  "https://github.com/saghen/blink.cmp.git",

  "https://github.com/windwp/nvim-autopairs.git",
  "https://github.com/HiPhish/rainbow-delimiters.nvim.git",
  "https://github.com/dstein64/nvim-scrollview.git",
  "https://github.com/folke/trouble.nvim.git",
  "https://github.com/oribarilan/lensline.nvim.git",
  "https://github.com/dstein64/vim-startuptime.git",
  "https://github.com/nvim-lualine/lualine.nvim.git",
  "https://github.com/stevearc/quicker.nvim.git",
  "https://github.com/nvim-mini/mini.starter",
  "https://github.com/Bekaboo/dropbar.nvim",
  "https://github.com/lukas-reineke/indent-blankline.nvim.git",
  "https://github.com/rebelot/kanagawa.nvim",
  "https://github.com/nanozuki/tabby.nvim",
  "https://github.com/rachartier/tiny-code-action.nvim"
})
