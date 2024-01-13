local load_config = require('plugins.utils').load_config

return {
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    ft = 'markdown',
    config = load_config('obsidian'),
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },

  {
    'nvim-neorg/neorg',
    ft = 'norg',
    config = load_config('neorg'),
  },
}
