require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash',
    'python',
    'lua',
    'javascript',
    'typescript',
    'sql',
    'markdown',
    'markdown_inline',
    'toml',
    'yaml',
    'json',
    'norg',
    'csv',
    'latex',
    'vim',
    'vimdoc',
    'gitcommit',
    'gitignore',
    'git_config',
    'make',
    'ssh_config',
    'dockerfile',
    'diff',
    'regex',
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
