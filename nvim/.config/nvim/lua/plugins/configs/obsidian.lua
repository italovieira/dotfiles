local obsidian = require('obsidian')

obsidian.setup({
  workspaces = {
    {
      name = 'notes',
      path = '~/notes',
    },
    {
      name = 'work',
      path = '~/work/notes',
    },
  },

  daily_notes = {
    folder = 'daily',
  },

  completion = {
    nvim_cmp = true,
  },

  mappings = {
    ['gf'] = {
      action = function()
        return obsidian.util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
    ['<c-space>'] = {
      action = function()
        return obsidian.util.toggle_checkbox()
      end,
      opts = { buffer = true },
    },
  },

  note_id_func = function(title)
    if title ~= nil then
      return title
    end

    local suffix = ''
    for _ = 1, 4 do
      suffix = suffix .. string.char(math.random(65, 90))
    end
    return tostring(os.time()) .. '-' .. suffix
  end,

  disable_frontmatter = true,
})
