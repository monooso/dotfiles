local M = {}

M.setup = function()
  -- Set the colour scheme background to transparent when it's loaded.
  vim.api.nvim_create_autocmd("ColorScheme", {
    command = "highlight Normal ctermbg=none guibg=#none"
  })

  -- Set the colour scheme.
  vim.cmd([[ colorscheme PaperColorSlim ]])

  -- Set up Lualine.
  require("lualine").setup()
end

return M
