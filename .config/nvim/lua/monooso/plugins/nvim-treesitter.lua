-- Install Treesitter configurations.
--
-- @see https://github.com/nvim-treesitter/nvim-treesitter
return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false
}
