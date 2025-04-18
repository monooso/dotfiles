-- Enables LSP servers, and auto-completion from LSP sources.
--
-- If a language servers cannot be found, Neovim will simply ignore the config.
-- Running `:checkhealth lsp` will display a warning for each missing language server,
-- but everything works correctly.

-- Enable the language servers.
vim.lsp.enable({
    'cssls',
    'elixirls',
    'html',
    'intelephense',
    'lua_ls',
    'jsonls',
    'ts_ls',
})
