vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  once = true,
  callback = function()
    vim.pack.add({
      { src = 'https://github.com/obsidian-nvim/obsidian.nvim', version = vim.version.range('*') },
      'https://github.com/nvim-lua/plenary.nvim',
    })

    local obsidian = require('obsidian')

    local workspaces = {}
    for _, workspace in ipairs({
      {
        name = 'personal',
        path = vim.env.PERSONAL_NOTES_PATH or '~/notes',
      },
      {
        name = 'work',
        path = vim.env.WORK_NOTES_PATH or '~/work/notes',
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

      frontmatter = { enabled = true },

      legacy_commands = false,
    })

    -- Obsidian's FileType handler creates a BufEnter autocmd that activates
    -- the buffer. Re-emit both so the chain completes for the initial buffer.
    vim.schedule(function()
      vim.api.nvim_exec_autocmds('FileType', { buffer = 0 })
      vim.api.nvim_exec_autocmds('BufEnter', { buffer = 0 })
    end)
  end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'ObsidianNoteEnter',
  callback = function()
    vim.keymap.del('n', '<CR>', { buffer = true })
    vim.keymap.set('n', 'gf', require('obsidian.api').smart_action, { expr = true, buffer = true, desc = 'Follow obsidian link' })
  end,
})
