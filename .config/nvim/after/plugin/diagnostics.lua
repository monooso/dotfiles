local wk = require('which-key')

-- Configure how diagnostic messages are shown.
vim.diagnostic.config({
  float = { border = 'single', scope = 'cursor' },
  severity_sort = true,
  source = true,
  virtual_text = false
})

wk.add({
  mode = { 'n' },
  { '<leader>d',  group = 'Diagnostics' },
  { '<leader>dl', function() vim.diagnostic.open_float({ scope = 'buffer' }) end, desc = 'List buffer diagnostic messages' },
  { '<leader>dn', vim.diagnostic.goto_next,                                       desc = 'Next diagnostic message' },
  { '<leader>dp', vim.diagnostic.goto_prev,                                       desc = 'Previous diagnostic message' },
  { '<leader>dq', vim.diagnostic.setloclist,                                      desc = 'Send diagnostics to location list' },
})
