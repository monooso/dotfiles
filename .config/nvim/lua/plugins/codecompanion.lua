return {
    'olimorris/codecompanion.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
        'hrsh7th/nvim-cmp',
        'nvim-telescope/telescope.nvim',
        { 'MeanderingProgrammer/render-markdown.nvim', ft = { 'markdown', 'codecompanion' } },
        { 'stevearc/dressing.nvim',                    opts = {} },
    },
    config = true
}
