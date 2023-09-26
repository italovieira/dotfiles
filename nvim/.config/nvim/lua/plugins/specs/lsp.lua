local load_config = require('plugins.utils').load_config

return {
  {
    'neovim/nvim-lspconfig',
    lazy = true,
    config = load_config('lspconfig'),
    dependencies = { 'folke/neodev.nvim' },
  },

  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup()
    end,
  },
}
