-- Configure the mini.pick plugin, a Telescope replacement.
--
-- @see https://github.com/echasnovski/mini.nvim

require('mini.pick').setup()
require('mini.extra').setup()

local builtin = MiniPick.builtin
local pickers = MiniExtra.pickers

-- The prefix `n` has no semantic meaning (it used to be `g`, for "go"). It's purely
-- an exercise in efficiency. `<Leader>` (space) is under my left thumb, `n` is under
-- my right index finger, and the modifiers are all under strong fingers on my left
-- hand. So any command is left-right-left.
vim.keymap.set({ 'n' }, '<Leader>nd', pickers.diagnostic, { desc = 'Diagnostics' })
vim.keymap.set({ 'n' }, '<Leader>np', builtin.files, { desc = 'Files' })
vim.keymap.set({ 'n' }, '<Leader>ng', builtin.grep_live, { desc = 'Grep' })
vim.keymap.set({ 'n' }, '<Leader>nb', pickers.marks, { desc = 'Bookmarks' })

-- The Neovim LSP implementation has this built-in (`gO`), but it opens the
-- results in a split. This is much nicer.
vim.keymap.set({ 'n' }, '<Leader>ns', function()
  pickers.lsp({ scope = 'document_symbol' })
end, { desc = 'Document symbols' })
