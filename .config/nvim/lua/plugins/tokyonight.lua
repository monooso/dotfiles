return {
    'folke/tokyonight.nvim',
    config = {
        on_colors = function(c)
            c.border = c.blue0
        end
    },
    lazy = false,
    priority = 1000
}
