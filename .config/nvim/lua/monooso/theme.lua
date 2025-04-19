-- Sets the theme.
require('rose-pine').setup({
    variant = 'auto',
    dark_variant = 'main',
    enable = { legacy_highlights = false }
})

vim.cmd({ 'colorscheme', 'rose-pine' })
