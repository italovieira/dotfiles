local M = {}

M.load_config = function(name)
  return function()
    require(string.format('plugins.configs.%s', name))
  end
end

return M
