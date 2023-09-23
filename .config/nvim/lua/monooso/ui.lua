local M = {}

M.setup = function()
  -- Set the colorscheme.
  vim.cmd([[ colorscheme nord ]])

  -- Set up Lualine.
  require("lualine").setup()
end

return M
