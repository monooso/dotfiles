require('conform').setup({
  format_on_save = {
    lsp_format = 'fallback',
    timeout_ms = 1500
  },
  formatters_by_ft = {
    vue = { 'prettierd', 'prettier', stop_after_first = true }
  }
})
