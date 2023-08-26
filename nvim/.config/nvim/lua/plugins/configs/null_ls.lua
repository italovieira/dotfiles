local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  on_attach = require('lsp.init').on_attach,

  sources = {
    formatting.autopep8,
    formatting.prettier,
    formatting.jq,
    formatting.stylua,
    diagnostics.flake8,
    diagnostics.eslint,
    code_actions.gitsigns,
  },
})
