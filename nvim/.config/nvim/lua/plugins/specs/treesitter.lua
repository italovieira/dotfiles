local load_config = require('plugins.utils').load_config

return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = load_config('treesitter'),
    build = ':TSUpdate',
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  },

  'nvim-treesitter/nvim-treesitter-context',
}
