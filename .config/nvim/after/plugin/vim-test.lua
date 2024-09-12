local wk = require('which-key')

wk.add({
  {
    mode = { 'n' },
    { '<leader>t',  group = 'Test...' },
    { '<leader>tf', '<cmd>TestFile<cr>',    desc = 'File' },
    { '<leader>tl', '<cmd>TestLast<cr>',    desc = 'Last' },
    { '<leader>tn', '<cmd>TestNearest<cr>', desc = 'Nearest' },
    { '<leader>ts', '<cmd>TestSuite<cr>',   desc = 'Suite' },
    { '<leader>tv', '<cmd>TestVisit<cr>',   desc = 'Visit last test' },
  }
})
