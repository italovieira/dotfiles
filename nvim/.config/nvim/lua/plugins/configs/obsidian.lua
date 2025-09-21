local obsidian = require('obsidian')

local workspaces = {}
for _, workspace in ipairs({
  {
    name = 'personal',
    path = vim.env.PERSONAL_NOTES_PATH or '~/notes'
  },
  {
    name = 'work',
    path = vim.env.WORK_NOTES_PATH or '~/work/notes'
  },
}) do
  if vim.uv.fs_stat(vim.fs.abspath(workspace.path)) then
    table.insert(workspaces, workspace)
  end
end

obsidian.setup({
  workspaces = workspaces,

  daily_notes = {
    folder = 'daily',
  },

  completion = {
    blink = true,
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

  legacy_commands = false,
})
