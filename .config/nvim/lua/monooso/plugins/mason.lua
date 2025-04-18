-- Install Mason, a package manager for LSP servers, DAP servers,
-- linters, and formatters.
--
-- @see https://github.com/williamboman/mason.nvim

return {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    -- mason-tool-installer,
    event = 'VeryLazy',

    dependencies = {
        'neovim/nvim-lspconfig'
    }
}

