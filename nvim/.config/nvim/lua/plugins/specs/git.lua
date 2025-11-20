return {
  {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    cmd = 'Neogit',
  },
  {
    'sindrets/diffview.nvim',
    opts = {
      keymaps = {
        view = {
          -- to not conflict with diagnostics toggle
          ["<leader>e"] = false,
        }
      },
    },
  },
  {
    'lewis6991/gitsigns.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  },
}
