-- Configure the conform.nvim plugin
--
-- @see https://github.com/stevearc/conform.nvim

require('conform').setup({
  notify_on_error = false,

  format_on_save = {
    lsp_format = 'fallback',
    timeout_ms = 500
  },

  formatters_by_ft = {
    lua = { 'stylua' }
  }
})
