return require('packer').startup(function()
  local config = function(name)
    require(string.format('plugins.%s', name))
  end

  use('wbthomason/packer.nvim') -- packer can manage itself

  use('neovim/nvim-lspconfig')

  use({
    'nvim-treesitter/nvim-treesitter',
    config = config('treesitter'),
    run = 'TSUpdate',
  })
  use('nvim-treesitter/nvim-treesitter-textobjects')

  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    },
    config = config('telescope'),
  })
  use('tpope/vim-fugitive')
  use('tpope/vim-surround')
  use('tpope/vim-repeat')
  use({
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = require('gitsigns').setup(),
  })
  use({
    'windwp/nvim-autopairs',
    config = require('nvim-autopairs').setup({}),
  })
  use({
    'numToStr/Comment.nvim',
    config = require('Comment').setup(),
  })
  use({
    'mfussenegger/nvim-dap',
    requires = {
      'mfussenegger/nvim-dap-python',
      'rcarriga/nvim-dap-ui',
    },
    config = config('dap'),
  })

  use({
    'morhetz/gruvbox',
    config = vim.api.nvim_set_var('gruvbox_italic', 1),
  })
  use('chriskempson/base16-vim')

  use({
    'hrsh7th/nvim-cmp',
    config = config('cmp'),
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
  })
  use({
    'L3MON4D3/LuaSnip',
    requires = {
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
    },
    config = config('luasnip')
  })

  use({
    'jose-elias-alvarez/null-ls.nvim',
    config = config('null_ls'),
  })

  use('andymass/vim-matchup')
  use({
    'folke/which-key.nvim',
    config = require('which-key').setup({})
  })

  use({
    'nvim-neorg/neorg',
    config = config('neorg')
  })
end)
