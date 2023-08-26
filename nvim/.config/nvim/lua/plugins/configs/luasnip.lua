local ls = require('luasnip')
local types = require('luasnip.util.types')

ls.setup({
  history = true,
  update_events = 'TextChanged,TextChangedI',
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { '«', 'NonText' } },
        priority = 0,
      },
    },
  },
})

vim.keymap.set({ 'i', 's' }, '<c-j>', function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<c-k>', function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<c-l>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

require('luasnip.loaders.from_lua').lazy_load({ paths = '~/.config/nvim/lua/snippets/' })
require('luasnip.loaders.from_vscode').lazy_load()
