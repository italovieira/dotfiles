require('neorg').setup({
  load = {
    ['core.defaults'] = {},
    ['core.dirman'] = {
      config = {
        workspaces = {
          home = '~/notes/',
          work = '~/work/notes/',
        },
      },
    },
    ['core.concealer'] = {},
    ['core.completion'] = {
      config = {
        engine = 'nvim-cmp',
      },
    },
  },
})
