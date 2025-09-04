local load_config = require('plugins.utils').load_config

return {
  {
    'tpope/vim-surround',
    'tpope/vim-repeat',
  },

  {
    {
      'saghen/blink.cmp',
      dependencies = { 'rafamadriz/friendly-snippets' },
      version = '*',
      opts_extend = { 'sources.default' },
      config = load_config('blink_cmp')
    },

    {
      'L3MON4D3/LuaSnip',
      dependencies = {
        'rafamadriz/friendly-snippets',
      },
      config = load_config('luasnip'),
    },
  },

  {
    'nvimtools/none-ls.nvim',
    dependencies = {
      'nvimtools/none-ls-extras.nvim',
    },
    config = load_config('none_ls'),
  },

  'andymass/vim-matchup',

  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'mfussenegger/nvim-dap-python',
      {
        'rcarriga/nvim-dap-ui',
        dependencies = {
          'nvim-neotest/nvim-nio',
        },
      },
      'theHamsta/nvim-dap-virtual-text',
    },
    config = load_config('dap'),
  },

  {
    'tpope/vim-dadbod',
    dependencies = {
      'kristijanhusak/vim-dadbod-ui',
      'kristijanhusak/vim-dadbod-completion',
    },
  },
}
