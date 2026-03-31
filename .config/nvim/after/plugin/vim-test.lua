-- Configure the vim-test plugin
--
-- @see https://github.com/vim-test/vim-test

local map = vim.keymap.set

map({ 'n' }, '<Leader>tn', '<cmd>TestNearest<cr>', { desc = 'Nearest test' }) -- [T]est
map({ 'n' }, '<Leader>tl', '<cmd>TestLast<cr>', { desc = 'Last test' })       -- [L]ast
map({ 'n' }, '<Leader>ts', '<cmd>TestSuite<cr>', { desc = 'Test suite' })     -- [S]uite
map({ 'n' }, '<Leader>tf', '<cmd>TestFile<cr>', { desc = 'Test file' })       -- [F]ile
map({ 'n' }, '<Leader>tg', '<cmd>TestVisit<cr>', { desc = 'Goto last test' }) -- [G]oto
