-- Configure Toggleterm.
--
-- @see https://github.com/akinsho/toggleterm.nvim
require('toggleterm').setup({
  direction = 'vertical',
  open_mapping = [[<c-\>]],
  shade_terminals = false,
  size = function()
    return vim.o.columns * 0.4
  end
})
