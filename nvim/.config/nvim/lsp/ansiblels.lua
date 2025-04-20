return {
  cmd = { 'ansible-language-server', '--stdio' },
  settings = {
    redhat = { telemetry = { enabled = false } },
  },
  filetypes = { 'yaml.ansible' },
  root_markers = { 'ansible.cfg', '.ansible-lint' },
}
