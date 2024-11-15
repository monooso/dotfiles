local builtin = require('telescope.builtin')
local telescope = require('telescope')
local wk = require('which-key')

wk.add({
  {
    mode = { 'n' },
    { '<leader>gb', builtin.buffers,                   desc = 'Buffer' },
    { '<leader>gd', builtin.diagnostics,               desc = 'Diagnostics' },
    { '<leader>ge', '<cmd>Fern . -reveal=% -stay<cr>', desc = 'File explorer' },
    { '<leader>gf', builtin.find_files,                desc = 'File' },
    { '<leader>gg', builtin.live_grep,                 desc = 'Grep' },
    { '<leader>gh', builtin.help_tags,                 desc = 'Help' },
    { '<leader>gs', builtin.lsp_document_symbols,      desc = 'Document symbol' },
  }
})

telescope.setup({
  defaults = {
    file_ignore_patterns = { '^.git/', '^node_modules/' }
  },
  pickers = {
    find_files = {
      find_command = { 'rg', '--hidden', '--files' }
    },
    live_grep = {
      additional_args = function()
        return { '--hidden' }
      end
    }
  }
})
