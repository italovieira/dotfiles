return {
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
}
