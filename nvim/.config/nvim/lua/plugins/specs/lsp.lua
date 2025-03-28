local load_config = require('plugins.utils').load_config

return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },
}
