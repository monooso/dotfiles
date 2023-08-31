-- Configure how diagnostic messages are shown.
vim.diagnostic.config({
  float = { focus = false, scope = 'cursor' },
  severity_sort = true,
  source = true,
  virtual_text = true
})

require('monooso.utils').register_keymap({ 'n' }, 'd', {
  name = 'Diagnostics',
  -- Step through diagnostic messages.
  n = { vim.diagnostic.goto_next, 'Next diagnostic message' },
  p = { vim.diagnostic.goto_prev, 'Previous diagnostic message' },

  -- Open a list of all the diagnostic messages for the current buffer.
  l = { function() vim.diagnostic.open_float({ scope = 'buffer' }) end, 'List buffer diagnostic messages' },

  -- Populate the location list with the diagnostic messages.
  q = { vim.diagnostic.setloclist, 'Populate location list with diagnostics' }
})
