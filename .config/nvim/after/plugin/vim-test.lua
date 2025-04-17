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

-- Attempt to configure vim-test using Lua. Possibly an exercise in futility.
local M = {
  env = { sail_executable = 'vendor/bin/sail' },
  flags = { sail_is_enabled = false }
}

local function sail_is_enabled()
  if M.flags.sail_is_enabled then
    return true
  end

  M.flags.sail_is_enabled =
      (vim.fn.filereadable(M.env.sail_executable) == 1)
      and (vim.fn.filereadable('docker-compose.yml') == 1)

  return M.flags.sail_is_enabled
end

-- This only works when opening Neovim in the project root,
-- but that's typical.
if sail_is_enabled() then
  vim.g['test#php#pest#executable'] = 'sail pest'
end
