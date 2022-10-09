local  null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  sources = {
    formatting.autopep8,
    formatting.prettier,
    formatting.jq,
    diagnostics.flake8,
    code_actions.gitsigns,
  }
})
