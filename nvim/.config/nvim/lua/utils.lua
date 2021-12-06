local M = {}

M.map = function(mode, lhs, rhs, opts)
  opts = {noremap = true, silent = true, unpack(opts or {})}
  return vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

for _, mode in ipairs({'n', 'o', 'i', 'x', 't'}) do
    M[mode .. 'map'] = function(...)
        M.map(mode, ...)
    end
end

return M
