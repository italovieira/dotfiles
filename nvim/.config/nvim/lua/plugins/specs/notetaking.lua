local load_config = require('plugins.utils').load_config

return {
  {
    'obsidian-nvim/obsidian.nvim',
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

  {
    'MeanderingProgrammer/render-markdown.nvim',
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },

  {
    '3rd/image.nvim',
    build = false,
    opts = {
      processor = 'magick_cli',
    },
  },
  {
    'HakonHarnes/img-clip.nvim',
    event = 'VeryLazy',
    opts = {},
  },
}
