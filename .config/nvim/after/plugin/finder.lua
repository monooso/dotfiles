-- Configure Telescope
require('telescope').setup({
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

-- Configure Fern
vim.g['fern#default_hidden'] = 1
