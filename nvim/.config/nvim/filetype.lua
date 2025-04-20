vim.filetype.add({
  extension = {
    j2 = 'jinja',
  },
  pattern = {
    -- This is to enable ansible-language-server for these files
    ['.*playbooks/.*%.ya?ml'] = 'yaml.ansible',
  },
})
