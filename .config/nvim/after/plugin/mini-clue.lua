-- Configure the mini.clue plugin, a replacement for Which Key.
--
-- @see https://github.com/echasnovski/mini.nvim

require('mini.clue').setup({
  triggers = {
    -- Leader-prefixed key bindings.
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },

    -- `g` prefixed key bindings.
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },
  },
  window = { delay = 250 }
})
