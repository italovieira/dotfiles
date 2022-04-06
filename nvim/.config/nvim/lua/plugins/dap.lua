require('dap-python').setup('~/.venvs/debugpy/bin/python')

local dap = require('dap')
local dapui = require('dapui')
local u = require('utils')

dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

u.nmap('<leader>dc', '<cmd>lua require("dap").continue()<cr>')
u.nmap('<leader>ds', '<cmd>lua require("dap").close()<cr>')
u.nmap('<leader>dl', '<cmd>lua require("dap").run_last()<cr>')

u.nmap('<leader>do', '<cmd>lua require("dap").step_over()<cr>')
u.nmap('<leader>di', '<cmd>lua require("dap").step_into()<cr>')
u.nmap('<leader>dO', '<cmd>lua require("dap").step_out()<cr>')

u.nmap('<leader>db', '<cmd>lua require("dap").toggle_breakpoint()<cr>')
u.nmap('<leader>dbc', '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<cr>')
u.nmap('<leader>dbl', '<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<cr>')

u.nmap('<leader>dj', '<cmd>lua require("dap").down()<cr>')
u.nmap('<leader>dk', '<cmd>lua require("dap").up()<cr>')
u.nmap('<leader>dr', '<cmd>lua require("dap").repl.toggle()<cr>')

u.nmap('<leader>dK', '<cmd>lua require("dap.ui.widgets").hover()<cr>')
u.nmap('<leader>d?', '<cmd>lua local widgets = require("dap.ui.widgets"); widgets.centered_float(widgets.scopes)<cr>')

require('dapui').setup()
u.nmap('<leader>du', '<cmd>lua require("dapui").toggle()<cr>')
