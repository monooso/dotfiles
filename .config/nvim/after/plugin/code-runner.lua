-- Configure the Code Runner plugin.
--
-- @see https://github.com/CRAG666/code_runner.nvim

vim.keymap.set('n', '<leader>rr', ':RunCode<cr>', { noremap = true, silent = false })

require('code_runner').setup({
  filetype = {
    ruby = "ruby $file"
  },
  float = {
    border = 'bold',
    height = 0.8,
    width = 0.4,
    x = 0.5,
    y = 0.1
  },
  mode = 'float'
})
