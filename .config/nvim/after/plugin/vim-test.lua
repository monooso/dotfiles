-- Configure the vim-test plugin
--
-- @see https://github.com/vim-test/vim-test

local map = vim.keymap.set

-- The prefix for tests used to be `t`, logically enough. The downside was that
-- both `t` and `<Leader>` (space) are under my left hand.
--
-- You can, if you wish, kid yourself that `e` means "execute". The reality is that
-- it's purely an exercise in efficiency, as `e` is under my right middle finger, and
-- the modifiers are all under strong fingers on my left hand. So any command is
-- left-right-left.
map({ 'n' }, '<Leader>et', '<cmd>TestNearest<cr>', { desc = 'Nearest test' }) -- [T]est
map({ 'n' }, '<Leader>ep', '<cmd>TestLast<cr>', { desc = 'Last test' })       -- [P]revious
map({ 'n' }, '<Leader>es', '<cmd>TestSuite<cr>', { desc = 'Test suite' })     -- [S]uite
map({ 'n' }, '<Leader>ef', '<cmd>TestFile<cr>', { desc = 'Test file' })       -- [F]ile
map({ 'n' }, '<Leader>eg', '<cmd>TestVisit<cr>', { desc = 'Goto last test' }) -- [G]oto
