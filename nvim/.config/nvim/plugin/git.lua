vim.pack.add({
  'https://github.com/NeogitOrg/neogit',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/sindrets/diffview.nvim',
  'https://github.com/lewis6991/gitsigns.nvim',
})

require('diffview').setup({
  keymaps = {
    view = {
      ['<leader>e'] = false,
    },
  },
})
require('gitsigns').setup()
