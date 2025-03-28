return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc' },

  settings = {
    Lua = {
      hint = { enable = true },
      workspace = {
        checkThirdParty = false,
        -- Make the server aware of Neovim lua runtime files
        -- https://github.com/neovim/nvim-lspconfig/blob/ff6471d4f837354d8257dfa326b031dd8858b16e/lua/lspconfig/configs/lua_ls.lua#L61
        library = vim.api.nvim_get_runtime_file('lua', true),
      },
      completion = { callSnippet = 'Replace' },
    },
  },
}
