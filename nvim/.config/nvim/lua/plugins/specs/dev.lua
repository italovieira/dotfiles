local load_config = require('plugins.utils').load_config

return {
  {
    'tpope/vim-surround',
    'tpope/vim-repeat',
  },

  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end,
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },

  {
    {
      'hrsh7th/nvim-cmp',
      config = load_config('cmp'),
      dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
      },
    },

    {
      'L3MON4D3/LuaSnip',
      dependencies = {
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',
      },
      config = load_config('luasnip'),
    },
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    config = load_config('null_ls'),
  },

  'andymass/vim-matchup',

  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'mfussenegger/nvim-dap-python',
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
    },
    config = load_config('dap'),
  },

  {
    'tpope/vim-dadbod',
    dependencies = {
      'kristijanhusak/vim-dadbod-ui',
      {
        'kristijanhusak/vim-dadbod-completion',
        dependencies = 'nvim-cmp',
      },
    },
  },

  { 'folke/neodev.nvim', opts = {} },
}
