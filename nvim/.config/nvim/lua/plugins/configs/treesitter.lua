require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash',
    'git_config',
    'gitcommit',
    'gitignore',
    'javascript',
    'latex',
    'lua',
    'make',
    'markdown',
    'markdown_inline',
    'norg',
    'python',
    'regex',
    'sql',
    'vim',
    'vimdoc',
    'yaml',
  },

  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,

    keymaps = {
      init_selection = '<cr>',
      node_incremental = '<cr>',
      node_decremental = '<bs>',
    },
  },

  textobjects = {
    select = {
      enable = true,
      lookahead = true,

      keymaps = {
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['am'] = '@function.outer',
        ['im'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },

    move = {
      enable = true,
      set_jumps = true,

      goto_next_start = {
        [']a'] = '@parameter.inner',
        [']]'] = '@class.outer',
        [']m'] = '@function.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[a'] = '@parameter.inner',
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
})
