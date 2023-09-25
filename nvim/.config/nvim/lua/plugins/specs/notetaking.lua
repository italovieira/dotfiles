local load_config = require('plugins.utils').load_config

return {
  {
    'nvim-neorg/neorg',
    config = load_config('neorg'),
  },
}
