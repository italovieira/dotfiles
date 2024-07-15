local dap = require('dap')
local dapui = require('dapui')
local widgets = require('dap.ui.widgets')

dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.before.event_terminated['dapui_config'] = dapui.close
dap.listeners.before.event_exited['dapui_config'] = dapui.close

vim.keymap.set('n', '<leader>dc', dap.continue)
vim.keymap.set('n', '<leader>ds', dap.close)
vim.keymap.set('n', '<leader>dl', dap.run_last)

vim.keymap.set('n', '<leader>di', dap.step_into)
vim.keymap.set('n', '<leader>do', dap.step_over)
vim.keymap.set('n', '<leader>dO', dap.step_out)
vim.keymap.set('n', '<leader>d-', dap.step_back)

vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>dbc', function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)
vim.keymap.set('n', '<leader>dbl', function()
  dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end)

vim.keymap.set('n', '<leader>dj', dap.down)
vim.keymap.set('n', '<leader>dk', dap.up)
vim.keymap.set('n', '<leader>dr', dap.repl.toggle)

vim.keymap.set('n', '<leader>dK', widgets.hover)
vim.keymap.set('n', '<leader>d?', function()
  widgets.centered_float(widgets.scopes)
end)

dapui.setup()
vim.keymap.set('n', '<leader>du', dapui.toggle)

require('nvim-dap-virtual-text').setup()
require('dap-python').setup('~/.venvs/debugpy/bin/python')
