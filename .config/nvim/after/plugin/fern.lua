-- Configure Fern.
--
-- @see https://github.com/lambdalisue/vim-fern

-- Show hidden files.
vim.g['fern#default_hidden'] = 1

-- Open Fern with `<Leader>nt`. Think [t]ree.
vim.keymap.set({ 'n' }, '<Leader>nt', '<cmd>Fern . -reveal=% -stay<cr>', { desc = 'File explorer' })
