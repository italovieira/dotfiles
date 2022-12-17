download_packer = function()
  if vim.fn.input('Install Packer (y for yes)? ') ~= 'y' then
    return
  end

  local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

  vim.notify('Installing Packer...')

  vim.fn.system({
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    packer_path,
  })

  vim.notify('...done. Need restart now!')
end

local ok, packer = pcall(require, 'packer')
if not ok then
  download_packer()
  return
end

return packer.startup(function()
  local config = function(name)
      return string.format('require("plugins.%s")', name)
  end

  use('wbthomason/packer.nvim') -- packer can manage itself

  use('neovim/nvim-lspconfig')

  use({
    'nvim-treesitter/nvim-treesitter',
    config = config('treesitter'),
    run = ':TSUpdate',
  })
  use({
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  })

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
    config = function()
      require('gitsigns').setup()
    end,
  })
  use({
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end,
  })
  use({
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
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
    config = function()
      require('which-key').setup({})
    end,
  })

  use({
    'nvim-neorg/neorg',
    config = config('neorg')
  })
end)
