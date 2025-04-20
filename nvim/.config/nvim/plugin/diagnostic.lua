vim.diagnostic.config({
  -- https://github.com/neovim/neovim/pull/31959
  virtual_lines = true,
  signs = true,
  underline = false,
  update_in_insert = false,
})

-- :help diagnostic-toggle-virtual-lines-example
vim.keymap.set('n', '<space>e', function()
  local new_config = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = 'Toggle diagnostic virtual_lines' })

vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
