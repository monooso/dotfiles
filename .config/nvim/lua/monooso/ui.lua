-- Configures Neovim UI tweaks.

-- Use a transparent background colour, to mask any minor discrepancies with the terminal.
vim.api.nvim_create_autocmd('ColorScheme', {
    callback = function()
        vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    end
})

vim.cmd([[ colorscheme tokyonight ]])
