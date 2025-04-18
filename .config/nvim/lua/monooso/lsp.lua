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
    'jsonls',
    'ts_ls',
})

-- Enable auto-completion.
local function lsp_on_attach_callback(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    if client:supports_method('textDocument/completion') then
        vim.lsp.completion.enable(true, client.id, event.buffer, { autotrigger = true })
    end
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = lsp_on_attach_callback,
    group = vim.api.nvim_create_augroup('monooso-lsp-attach', { clear = true })
})
