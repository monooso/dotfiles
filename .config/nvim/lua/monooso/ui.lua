local M = {}

M.setup = function()
  -- Tweak the default colorscheme when it's loaded.
  local colorscheme_group = vim.api.nvim_create_augroup("DefaultColorSchemeTweaks", { clear = true })

  vim.api.nvim_create_autocmd("ColorScheme", {
    command = "highlight Normal ctermbg=none guibg=#none",
    group = colorscheme_group,
    pattern = "default"
  })

  -- Set the colorscheme.
  vim.cmd([[ colorscheme default ]])

  -- Set up Lualine.
  require("lualine").setup()
end

return M
