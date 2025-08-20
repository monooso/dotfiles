-- Install Tokyo Night, to make things purdy.
--
-- As per the Lazy docs, we configure our colour scheme here, to ensure that
-- other plugins do not mess with the highlight groups.
--
-- @see https://lazy.folke.io/spec/lazy_loading#-colorschemes
-- @see https://github.com/folke/tokyonight.nvim

return {
    'folke/tokyonight.nvim',
    lazy = false,
    opts = {
        on_highlights = function(hl, colors)
            -- Improve the appearance of window splits.
            hl.WinSeparator = { bg = colors.none, fg = colors.yellow }
        end,
        style = 'moon',
        styles = {
            comments = { italic = false },
            keywords = { italic = false },
        },
    },
    priority = 1000,
}
