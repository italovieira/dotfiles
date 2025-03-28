vim.diagnostic.config({
  -- https://github.com/neovim/neovim/pull/31959
  virtual_lines = { current_line = true },
  signs = true,
  underline = false,
  update_in_insert = false,
})

vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
