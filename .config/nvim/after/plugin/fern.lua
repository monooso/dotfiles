-- Configure Fern.
--
-- @see https://github.com/lambdalisue/vim-fern

-- Show hidden files.
vim.g['fern#default_hidden'] = 1

-- Open Fern with `<Leader>ge`.
vim.keymap.set({ 'n' }, '<Leader>ge', '<cmd>Fern . -reveal=% -stay<cr>', { desc = 'File explorer' })
