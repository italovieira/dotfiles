local config = function(name)
  return function()
    require(string.format('plugins.configs.%s', name))
  end
end

return {
  {
    'neovim/nvim-lspconfig',
    lazy = true,
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

  {
    'nvim-treesitter/nvim-treesitter',
    config = config('treesitter'),
    build = ':TSUpdate',
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = config('telescope'),
  },
  'tpope/vim-fugitive',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  {
    'lewis6991/gitsigns.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('gitsigns').setup()
    end,
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
    'mfussenegger/nvim-dap',
    dependencies = {
      'mfussenegger/nvim-dap-python',
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
    },
    config = config('dap'),
  },

  {
    'morhetz/gruvbox',
    config = vim.api.nvim_set_var('gruvbox_italic', 1),
  },
  'chriskempson/base16-vim',
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme rose-pine]])
    end,
  },

  {
    'hrsh7th/nvim-cmp',
    config = config('cmp'),
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
    config = config('luasnip'),
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    config = config('null_ls'),
  },

  'andymass/vim-matchup',
  {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup({})
    end,
  },

  {
    'nvim-neorg/neorg',
    ft = 'norg',
    config = config('neorg'),
  },

  'nvim-treesitter/nvim-treesitter-context',
}
