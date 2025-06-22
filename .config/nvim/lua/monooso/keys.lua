-- Key bindings
local map = vim.keymap.set

local function opts(extras)
    return vim.tbl_deep_extend('force', { silent = true }, extras or {})
end

-- Escape clears search highlights in Normal mode.
map({ 'n' }, '<Esc>', '<cmd>nohlsearch<CR>')

-- Paste the last *yanked* text, because that is always what I meant to do.
map({ 'n', 'v' }, '<Leader>p', '"0p', opts())

-- Make the terminal less painful.
map({ 't' }, '<Esc>', [[<C-\><C-n>]], opts())
