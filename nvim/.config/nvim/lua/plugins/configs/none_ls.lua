local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,
    require('none-ls.formatting.jq'),
    null_ls.builtins.code_actions.gitsigns,
  },
})
