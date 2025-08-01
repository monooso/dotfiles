-- Install Tokyo Night, to make things purdy.
--
-- As per the Lazy docs, we configure our colour scheme here, to ensure that
-- other plugins do not mess with the highlight groups.
--
-- @see https://lazy.folke.io/spec/lazy_loading#-colorschemes
-- @see https://github.com/folke/tokyonight.nvim

return {
    'folke/tokyonight.nvim',
    config = function()
        vim.cmd('colorscheme tokyonight')
    end,
    lazy = false,
    opts = {
        style = 'moon',
        styles = {
            comments = { italic = false },
            keywords = { italic = false },
        },
    },
    priority = 1000,
}
