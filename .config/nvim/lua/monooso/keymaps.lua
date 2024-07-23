local function goto_harpooned_file(file_index)
  return function()
    require('harpoon.ui').nav_file(file_index)
  end
end

local M = {}

M.setup = function()
  local wk = require('which-key')

  local mapset = vim.keymap.set
  local keymap_opts = { silent = true }

  wk.add({
    {
      mode = { 'n' },
      { '<leader>ch', '<cmd>let @/=""<cr>', desc = 'Clear highlights' }
    }
  })

  -- Yank to the system clipboard, without reading the register docs first.
  mapset({ 'n', 'v' }, '<Leader>y', '"+y', keymap_opts)
  mapset('n', '<Leader>Y', 'gg"+yG', keymap_opts)

  -- Paste last *yanked* text, because that is always what I want.
  mapset({ 'n', 'v' }, '<Leader>p', '"0p', keymap_opts)

  -- Make the terminal less painful.
  mapset({ 't' }, '<Esc>', [[<C-\><C-n>]], keymap_opts)

  -- Find
  wk.add({
    {
      mode = { 'n' },
      { '<leader>f',  group = 'Find...' },
      { '<leader>fb', '<cmd>Telescope buffers<cr>',              desc = 'Buffer' },
      { '<leader>fe', '<cmd>Fern . -reveal=% -stay<cr>',         desc = 'Explorer' },
      { '<leader>ff', '<cmd>Telescope find_files<cr>',           desc = 'File' },
      { '<leader>fg', '<cmd>Telescope live_grep<cr>',            desc = 'Grep' },
      { '<leader>fh', '<cmd>Telescope help_tags<cr>',            desc = 'Help' },
      { '<leader>fs', '<cmd>Telescope lsp_document_symbols<cr>', desc = 'Document symbol' },
    }
  })

  -- Harpoon
  wk.add({
    {
      mode = { 'n' },
      { '<leader>h',  group = 'Harpoon' },
      { '<leader>hh', require('harpoon.ui').toggle_quick_menu, desc = 'Toggle quick menu' },
      { '<leader>hn', require('harpoon.mark').add_file,        desc = 'New' },

      -- Navigate to the first four Harpooned files.
      { '<leader>ht', goto_harpooned_file(1),                  desc = 'Goto first file' },
      { '<leader>hs', goto_harpooned_file(2),                  desc = 'Goto second file' },
      { '<leader>hr', goto_harpooned_file(3),                  desc = 'Goto third file' },
      { '<leader>ha', goto_harpooned_file(4),                  desc = 'Goto fourth file' },
    }
  })

  -- Test
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

  -- Easily maximise and equalise splits.
  wk.add({
    {
      mode = { 'i', 'n', 't', 'v' },
      { '<C-w>',  group = 'Window...' },
      { '<C-w>e', '<C-w>=',           desc = 'Equalise' },
      { '<C-w>m', '<C-w>|<C-w>_',     desc = 'Maximise' },
    }
  })
end

return M
