-- Enables LSP servers, and auto-completion from LSP sources.
--
-- If a language server cannot be found, Neovim will simply ignore the config.
-- Running `:checkhealth lsp` will display a warning for each missing language server,
-- but everything works correctly.

vim.lsp.enable({
    'elixirls',
    'html',
    'jsonls',
    'lua_ls',
    'ruby_lsp'
})
