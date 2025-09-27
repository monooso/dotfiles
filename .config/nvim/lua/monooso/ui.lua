-- Configures Neovim UI tweaks.

-- Use the default colour scheme with a transparent background.
vim.api.nvim_create_autocmd('ColorScheme', {
    callback = function()
        vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    end
})

vim.cmd([[ colorscheme default ]])
