vim.pack.add({
  'https://github.com/morhetz/gruvbox',
  'https://github.com/chriskempson/base16-vim',
  { src = 'https://github.com/rose-pine/neovim', name = 'rose-pine' },
  'https://github.com/rebelot/kanagawa.nvim',
  'https://github.com/catppuccin/nvim',
  'https://github.com/folke/tokyonight.nvim',
})

vim.g.gruvbox_italic = 1

vim.cmd.colorscheme(vim.env.NVIM_COLORSCHEME or 'gruvbox')
