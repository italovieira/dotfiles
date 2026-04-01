vim.pack.add({
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('*') },
  'https://github.com/rafamadriz/friendly-snippets',
})

require('blink-cmp').setup({
  -- for mappings similar to built-in completion
  keymap = { preset = 'default' },

  snippets = { preset = 'luasnip' },

  completion = { documentation = { auto_show = true } },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
    per_filetype = { sql = { 'dadbod' } },
  },

  fuzzy = { implementation = 'prefer_rust_with_warning' },
})
