local builtin = require('telescope.builtin')
local telescope = require('telescope')
local wk = require('which-key')

wk.add({
    {
        mode = { 'n' },
        { '<leader>f',  group = 'Find...' },
        { '<leader>fb', builtin.buffers,                   desc = 'Buffer' },
        { '<leader>fd', builtin.diagnostics,               desc = 'Diagnostics' },
        { '<leader>fe', '<cmd>Fern . -reveal=% -stay<cr>', desc = 'Explorer' },
        { '<leader>ff', builtin.find_files,                desc = 'File' },
        { '<leader>fg', builtin.live_grep,                 desc = 'Grep' },
        { '<leader>fh', builtin.help_tags,                 desc = 'Help' },
        { '<leader>fs', builtin.lsp_document_symbols,      desc = 'Document symbol' },
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
