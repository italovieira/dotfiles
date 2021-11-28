local cmp = require('cmp')

cmp.setup({

  mapping = {
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  },

  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        buffer = '[buf]',
        nvim_lsp = '[LSP]',
        path = '[path]',
      })[entry.source.name]
      return vim_item
    end
  }
})
