local function goto_harpooned_file(file_index)
  return function()
    require('harpoon.ui').nav_file(file_index)
  end
end

local M = {}

M.setup = function()
  local mapset = vim.keymap.set
  local keymap_opts = { silent = true }

  -- <Space> is my leader.
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '
  mapset({ 'n', 'v' }, '<Space>', '<Nop>', keymap_opts)

  require('monooso.utils').register_keymap({ 'n' }, 'c', {
    h = { '<cmd>let @/=""<cr>', 'Clear highlights' }
  })

  -- Yank to the system clipboard, without reading the register docs first.
  mapset({ 'n', 'v' }, '<Leader>y', '"+y', keymap_opts)
  mapset('n', '<Leader>Y', 'gg"+yG', keymap_opts)

  -- Paste last *yanked* text, because that is always what I want.
  mapset({ 'n', 'v' }, '<Leader>p', '"0p', keymap_opts)

  -- Make the terminal less painful.
  mapset({ 't' }, '<Esc>', [[<C-\><C-n>]], keymap_opts)

  -- Find
  require('monooso.utils').register_keymap({ 'n' }, 'f', {
    name = 'Find...',
    b = { '<cmd>Telescope buffers<cr>', 'Buffer' },
    e = { '<cmd>Fern . -reveal=% -stay<cr>', 'Explorer' },
    f = { '<cmd>Telescope find_files<cr>', 'File' },
    g = { '<cmd>Telescope live_grep<cr>', 'Grep' },
    h = { '<cmd>Telescope help_tags<cr>', 'Help' },
    s = { '<cmd>Telescope lsp_document_symbols<cr>', 'Document symbol' },
  })

  -- Harpoon
  require('monooso.utils').register_keymap({ 'n' }, 'h', {
    name = 'Harpoon...',
    h = { require('harpoon.ui').toggle_quick_menu, 'Toggle quick menu' },
    n = { require('harpoon.mark').add_file, 'New' },

    -- Navigate to the first four Harpooned files.
    t = { goto_harpooned_file(1), 'Goto first file' },
    s = { goto_harpooned_file(2), 'Goto second file' },
    r = { goto_harpooned_file(3), 'Goto third file' },
    a = { goto_harpooned_file(4), 'Goto fourth file' },
  })

  -- Test
  require('monooso.utils').register_keymap({ 'n' }, 't', {
    name = 'Test...',
    f = { '<cmd>TestFile<cr>', 'File' },
    l = { '<cmd>TestLast<cr>', 'Last' },
    n = { '<cmd>TestNearest<cr>', 'Nearest' },
    s = { '<cmd>TestSuite<cr>', 'Suite' },
    v = { '<cmd>TestVisit<cr>', 'Visit last test' },
  })

  -- EXPERIMENTAL: easier split navigation.
  -- Left
  mapset({ 'n' }, '<A-n>', '<C-w>h', keymap_opts)
  mapset({ 'i' }, '<A-n>', '<Esc><C-w>h', keymap_opts)
  mapset({ 't' }, '<A-n>', [[<C-\><C-n><C-w>h]], keymap_opts)

  -- Right
  mapset({ 'n' }, '<A-o>', '<C-w>l', keymap_opts)
  mapset({ 'i' }, '<A-o>', '<Esc><C-w>l', keymap_opts)
  mapset({ 't' }, '<A-o>', [[<C-\><C-n><C-w>l]], keymap_opts)

  -- Up
  mapset({ 'n' }, '<A-i>', '<C-w>k', keymap_opts)
  mapset({ 'i' }, '<A-i>', '<Esc><C-w>k', keymap_opts)
  mapset({ 't' }, '<A-i>', [[<C-\><C-n><C-w>k]], keymap_opts)

  -- Down
  mapset({ 'n' }, '<A-e>', '<C-w>j', keymap_opts)
  mapset({ 'i' }, '<A-e>', '<Esc><C-w>j', keymap_opts)
  mapset({ 't' }, '<A-e>', [[<C-\><C-n><C-w>j]], keymap_opts)

  -- EXPERIMENTAL: easier tab navigation using the arrow keys.
  -- Left
  mapset({ 'i', 'n', 't' }, '<A-S-n>', '<cmd>tabprevious<cr>', keymap_opts)

  -- Right
  mapset({ 'i', 'n', 't' }, '<A-S-o>', '<cmd>tabnext<cr>', keymap_opts)

  -- Up
  mapset({ 'i', 'n', 't' }, '<A-S-i>', '<cmd>tabfirst<cr>', keymap_opts)

  -- Down
  mapset({ 'i', 'n', 't' }, '<A-S-e>', '<cmd>tablast<cr>', keymap_opts)
end

return M
