require('plugins.telescope')

vim.pack.add({ 'https://github.com/stevearc/oil.nvim' })
require('oil').setup({ prompt_save_on_select_new_entry = false })

vim.pack.add({ 'https://github.com/folke/which-key.nvim' })
require('which-key').setup({})

vim.pack.add({
  { src = 'https://github.com/echasnovski/mini.nvim', version = vim.version.range('*') },
})
require('mini.cursorword').setup()
require('mini.indentscope').setup()
require('mini.pairs').setup()
require('mini.icons').setup()
