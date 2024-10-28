local mapset = vim.keymap.set

local function opts(extras)
    return vim.tbl_deep_extend('force', { silent = true }, extras or {})
end

-- Clear highlights
mapset({ 'n' }, '<Leader>ch', '<cmd>let @/=""<cr>', opts({ desc = 'Clear highlights' }))

-- Yank to the system clipboard, without reading the register docs first.
mapset({ 'n', 'v' }, '<Leader>y', '"+y', opts())
mapset('n', '<Leader>Y', 'gg"+yG', opts())

-- Paste last *yanked* text, because that is always what I want.
mapset({ 'n', 'v' }, '<Leader>p', '"0p', opts())

-- Make the terminal less painful.
mapset({ 't' }, '<Esc>', [[<C-\><C-n>]], opts())

-- Resize splits.
mapset({ 'i', 'n', 't', 'v' }, '<C-w>e', '<C-w>=', opts({ desc = 'Equalise splits' }))
mapset({ 'i', 'n', 't', 'v' }, '<C-w>m', '<C-w>|<C-w>_', opts({ desc = 'Maximise current split' }))
