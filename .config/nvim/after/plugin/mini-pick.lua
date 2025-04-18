-- Configure the mini.pick plugin, a Telescope replacement.
--
-- @see https://github.com/echasnovski/mini.nvim

require('mini.pick').setup()
require('mini.extra').setup()

local builtin = MiniPick.builtin
local pickers = MiniExtra.pickers

vim.keymap.set({ 'n' }, '<Leader>gd', pickers.diagnostic, { desc = 'Diagnostics' })
vim.keymap.set({ 'n' }, '<Leader>gf', builtin.files, { desc = 'Files' })
vim.keymap.set({ 'n' }, '<Leader>gg', builtin.grep_live, { desc = 'Grep' })
vim.keymap.set({ 'n' }, '<Leader>gk', pickers.keymaps, { desc = 'Keymaps' })
vim.keymap.set({ 'n' }, '<Leader>gm', pickers.marks, { desc = 'Marks' })

-- The Neovim LSP implementation has this built-in (`gO`), but it opens the
-- results in a split. This is much nicer.
vim.keymap.set({ 'n' }, '<Leader>gs', function()
  pickers.lsp({ scope = 'document_symbol' })
end,{ desc = 'Document symbols' })
