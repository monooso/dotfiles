local M = {}

M.setup = function()
  -- Set the colorscheme.
  vim.cmd([[ colorscheme rose-pine ]])

  -- Set up Lualine.
  require("lualine").setup()
end

return M
