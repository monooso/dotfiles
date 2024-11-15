local wk = require('which-key')

wk.add({ {
  mode = { 'n', 'v' },
  { '<leader>ga', '<cmd>CodeCompanionActions<cr>', desc = 'Code companion' }, -- Think "assistant"
} })

require('codecompanion').setup({
  display = {
    action_palette = {
      provider = 'telescope'
    },
    chat = {
      -- As per the docs, because we're using the `render-markdown.nvim` plugin.
      render_headers = false
    }
  }
})
