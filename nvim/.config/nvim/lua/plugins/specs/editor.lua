local load_config = require('plugins.utils').load_config

return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = load_config('telescope'),
  },

  {
    'stevearc/oil.nvim',
    opts = {
      prompt_save_on_select_new_entry = false,
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup({})
    end,
  },

  {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
      require('mini.comment').setup()
      require('mini.cursorword').setup()
      require('mini.indentscope').setup()
      require('mini.pairs').setup()
    end
  },
}
