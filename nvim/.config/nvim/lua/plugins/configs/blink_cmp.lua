require('blink-cmp').setup({
  -- for mappings similar to built-in completion
  keymap = { preset = 'default' },

  snippets = { preset = 'luasnip' },

  completion = { documentation = { auto_show = true } },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  fuzzy = { implementation = 'prefer_rust_with_warning' },
})
