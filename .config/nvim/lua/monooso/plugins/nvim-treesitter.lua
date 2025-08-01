-- Install Treesitter configurations.
--
-- @see https://github.com/nvim-treesitter/nvim-treesitter
return {
    'nvim-treesitter/nvim-treesitter',
    build = function()
        require('nvim-treesitter.install').update({ with_sync = true })
    end,
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    event = 'VeryLazy',
}
