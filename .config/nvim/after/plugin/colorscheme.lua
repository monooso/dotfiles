vim.o.background = 'light'
vim.cmd([[ colorscheme tokyonight-day ]])

-- Ideally this would live in after/plugin/lualine.lua, but
-- I don't think I can guarantee the load order.
require('lualine').setup()
