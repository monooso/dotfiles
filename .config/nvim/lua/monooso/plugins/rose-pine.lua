-- Install Rosé Pine, to make things purdy.
--
-- As per the Lazy docs, we configure our colour scheme here, to ensure that
-- other plugins do not mess with the highlight groups.
--
-- @see https://lazy.folke.io/spec/lazy_loading#-colorschemes
-- @see https://github.com/rose-pine/neovim

return {
    'rose-pine/neovim',
    config = function()
        vim.cmd('colorscheme rose-pine')
    end,
    lazy = false,
    name = 'rose-pine',
    opts = {
        variant = 'auto',
        dark_variant = 'main',
        enable = { legacy_highlights = false },
        styles = { italic = false }
    },
    priority = 1000,
}
