require('plugins.obsidian')

vim.pack.add({
  'https://github.com/MeanderingProgrammer/render-markdown.nvim',
  'https://github.com/3rd/image.nvim',
  'https://github.com/HakonHarnes/img-clip.nvim',
})

require('image').setup({ processor = 'magick_cli' })
