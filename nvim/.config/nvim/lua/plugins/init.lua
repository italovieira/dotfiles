return require('packer').startup(function()
  local config = function(name)
    require(string.format('plugins.%s', name))
  end

  use('wbthomason/packer.nvim') -- packer can manage itself

  use('neovim/nvim-lspconfig')

  use('tpope/vim-fugitive')
  use('tpope/vim-surround')
  use('tpope/vim-repeat')
  use('mhinz/vim-signify')

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
end)
