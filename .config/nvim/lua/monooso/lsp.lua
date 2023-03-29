local M = {}

local function lsp_on_attach(client, bufnr)
  local opts = { buffer = bufnr, silent = true }

  -- Jump to definition using <C-]>, just like with old-school tags.
  if client.server_capabilities.definitionProvider then
    vim.bo[bufnr].tagfunc = 'v:lua.vim.lsp.tagfunc'
  end

  -- Show the signature of the function under the cursor.
  if client.server_capabilities.hoverProvider then
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  end

  -- Show the available code actions.
  if client.server_capabilities.codeActionProvider then
    require('monooso.utils').register_keymap({ 'n' }, 'c', {
      name = 'Code',
      a = { vim.lsp.buf.code_action, 'Code action' }
    })
  end

  -- Format files using the LSP on save
  local formatting_group = vim.api.nvim_create_augroup('FormatOnSave', { clear = true })
  vim.api.nvim_create_autocmd('BufWritePre', {
    callback = function()
      vim.lsp.buf.format()
    end,
    group = formatting_group
  })

  -- Configure the diagnostics messages.
  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = true,
  })

  -- Use a shorter update time; otherwise we have to wait 4 seconds for the diagnostics to show.
  vim.o.updatetime = 250

  -- Show diagnostic messages for the current cursor position.
  -- If the diagnostic message is particularly long, you can focus the floating window with
  -- <C-w>w. Use the same command to return focus to the main window.
  local diagnostics_group = vim.api.nvim_create_augroup('DisplayDiagnotics', { clear = true })

  vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    callback = function()
      vim.diagnostic.open_float(nil)
    end,
    group = diagnostics_group
  })
end

local function extend_server_config(config)
  -- Tell the language servers that we support all the capabilities of `nvim-cmp`.
  local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

  return vim.tbl_deep_extend("force", {
    capabilities = lsp_capabilities,
    flags = { debounce_text_changes = 150 },
    on_attach = lsp_on_attach
  }, config or {})
end

local function require_if_supported(executable, lsp_name, config)
  if vim.fn.executable(executable) == 1 then
    require('lspconfig')[lsp_name].setup(extend_server_config(config))
  end
end

M.setup = function()
  -- Automatically install the servers required via LSP Config (below).
  -- Not convinced the main Mason setup belongs here, but don't have a better place.
  require('mason').setup()
  require('mason-lspconfig').setup({ automatic_installation = true })

  require('lspconfig')['astro'].setup(extend_server_config())
  require('lspconfig')['bashls'].setup(extend_server_config())
  require('lspconfig')['vimls'].setup(extend_server_config())

  require_if_supported('elixir', 'elixirls')
  require_if_supported('node', 'tailwindcss')
  require_if_supported('php', 'intelephense')
end

return M
