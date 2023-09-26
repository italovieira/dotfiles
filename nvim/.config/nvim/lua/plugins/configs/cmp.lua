local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ['<c-b>'] = cmp.mapping.scroll_docs(-4),
    ['<c-f>'] = cmp.mapping.scroll_docs(4),
    ['<c-e>'] = cmp.mapping.abort(),
    ['<c-y>'] = cmp.mapping.confirm({ select = true }),
    ['<c-space>'] = cmp.mapping.complete(),
  }),

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  }),

  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        buffer = '[buf]',
        nvim_lsp = '[LSP]',
        path = '[path]',
      })[entry.source.name] or vim_item.menu
      return vim_item
    end,
  },
})

cmp.setup.filetype('norg', {
  sources = cmp.config.sources({
    { name = 'neorg' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  }),
})

cmp.setup.filetype({ 'sql', 'mysql', 'plsql' }, {
  sources = cmp.config.sources({
    { name = 'vim-dadbod-completion' },
  }),
})
