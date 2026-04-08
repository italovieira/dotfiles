-- https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack#many-vim-pack-add
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then
        vim.cmd.packadd('nvim-treesitter')
      end
      vim.cmd('TSUpdate')
    end
  end,
})

vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
  'https://github.com/nvim-treesitter/nvim-treesitter-context',
})

-- Neovim includes these parsers:
-- c, lua, markdown, markdown_inline, vim, vimdoc
-- :help treesitter-parsers
require('nvim-treesitter').install({
  'bash',
  'python',
  'javascript',
  'typescript',
  'sql',
  'toml',
  'yaml',
  'json',
  'csv',
  'latex',
  'gitcommit',
  'gitignore',
  'git_config',
  'make',
  'ssh_config',
  'dockerfile',
  'diff',
  'regex',
})

-- To register yaml parser for yaml.ansible filetype
vim.treesitter.language.register('yaml', 'yaml.ansible')

local parsers_installed = require('nvim-treesitter.config').get_installed('parsers')
for _, parser in pairs(parsers_installed) do
  local filetypes = vim.treesitter.language.get_filetypes(parser)
  vim.api.nvim_create_autocmd({ 'FileType' }, {
    pattern = filetypes,
    callback = function()
      -- For more details, see :help nvim-treesitter-quickstart
      -- syntax highlighting, provided by Neovim
      vim.treesitter.start()
      -- folds, provided by Neovim
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo.foldmethod = 'expr'
      -- indentation, provided by nvim-treesitter
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })
end

require('nvim-treesitter-textobjects').setup({
  select = {
    lookahead = true,
  },
})

-- Select
local textobjects_select = require('nvim-treesitter-textobjects.select')
vim.keymap.set({ 'x', 'o' }, 'aa', function()
  textobjects_select.select_textobject('@parameter.outer', 'textobjects')
end)
vim.keymap.set({ 'x', 'o' }, 'ia', function()
  textobjects_select.select_textobject('@parameter.inner', 'textobjects')
end)
vim.keymap.set({ 'x', 'o' }, 'am', function()
  textobjects_select.select_textobject('@function.outer', 'textobjects')
end)
vim.keymap.set({ 'x', 'o' }, 'im', function()
  textobjects_select.select_textobject('@function.inner', 'textobjects')
end)
vim.keymap.set({ 'x', 'o' }, 'ac', function()
  textobjects_select.select_textobject('@class.outer', 'textobjects')
end)
vim.keymap.set({ 'x', 'o' }, 'ic', function()
  textobjects_select.select_textobject('@class.inner', 'textobjects')
end)

-- Moves
local textobjects_move = require('nvim-treesitter-textobjects.move')
vim.keymap.set({ 'n', 'x', 'o' }, ']a', function()
  textobjects_move.goto_next_start('@parameter.inner', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, ']]', function()
  textobjects_move.goto_next_start('@class.outer', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, ']m', function()
  textobjects_move.goto_next_start('@function.outer', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, ']M', function()
  textobjects_move.goto_next_end('@function.outer', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, '][', function()
  textobjects_move.goto_next_end('@class.outer', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, '[a', function()
  textobjects_move.goto_previous_start('@parameter.inner', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, '[m', function()
  textobjects_move.goto_previous_start('@function.outer', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, '[[', function()
  textobjects_move.goto_previous_start('@class.outer', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, '[M', function()
  textobjects_move.goto_previous_end('@function.outer', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, '[]', function()
  textobjects_move.goto_previous_end('@class.outer', 'textobjects')
end)
