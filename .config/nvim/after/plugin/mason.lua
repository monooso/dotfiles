-- Configure the mason.nvim and mason-lspconfig.nvim plugins.
--
-- @see https://github.com/williamboman/mason.nvim
-- @see https://github.com/williamboman/mason-lspconfig.nvim

require('mason').setup()

require('mason-lspconfig').setup({
  -- If there is a file for the LSP in the `lsp` directory, install it.
  automatic_installation = true
})
