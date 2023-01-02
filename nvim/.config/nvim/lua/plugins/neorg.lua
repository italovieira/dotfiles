require('neorg').setup({
  load = {
    ['core.defaults'] = {},
    ['core.norg.dirman'] = {
      config = {
        workspaces = {
          home = '~/notes/',
          work = '~/work/notes/',
        },
      },
    },
    ['core.norg.concealer'] = {},
    ['core.norg.completion'] = {
      config = {
        engine = 'nvim-cmp'
      }
    },
  }
})
