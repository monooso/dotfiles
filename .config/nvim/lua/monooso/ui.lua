local M = {}

M.setup = function()
  -- Set the colorscheme.
  vim.cmd([[ colorscheme github_dark_colorblind ]])

  -- Set up Lualine.
  require("lualine").setup()
end

return M
