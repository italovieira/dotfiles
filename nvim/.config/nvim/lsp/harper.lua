return {
  cmd = { 'harper-ls', '--stdio' },
  filetypes = { 'text', 'markdown', 'gitcommit', 'tex', 'typst' },
  settings = {
    ['harper-ls'] = {
      linters = {
        SentenceCapitalization = false,
        SpellCheck = false,
      },
    },
  },
  root_markers = { '.git' },
}
