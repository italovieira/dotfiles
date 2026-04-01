vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'd2', 'markdown' },
  callback = function()
    vim.pack.add({ 'https://github.com/terrastruct/d2-vim' })
  end,
  once = true,
})
