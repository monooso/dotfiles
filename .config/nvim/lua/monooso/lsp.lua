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

  -- Use a shorter update time; otherwise we have to wait 4 seconds for the diagnostics to show.
  vim.o.updatetime = 250

  -- Show diagnostic messages for the current cursor position.
  -- If the diagnostic message is particularly long, you can focus the floating window with
  -- <C-w>w. Use the same command to return focus to the main window.
  local diagnostics_group = vim.api.nvim_create_augroup('DisplayDiagnotics', { clear = true })

  vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    callback = function()
      -- Only display the diagnostics if we're not in "insert" mode.
      if vim.api.nvim_get_mode().mode ~= 'i' then
        vim.diagnostic.open_float(nil)
      end
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

M.setup = function()
  -- Automatically install the servers required via LSP Config (below).
  -- Not convinced the main Mason setup belongs here, but don't have a better place.
  require('mason').setup()
  require('mason-lspconfig').setup({ automatic_installation = true })

  local lsp_config = require('lspconfig')

  lsp_config['astro'].setup(extend_server_config())
  lsp_config['bashls'].setup(extend_server_config())
  lsp_config['vimls'].setup(extend_server_config())

  -- As per the Deno documentation, check for specific files in the
  -- root directory for both the Deno LSP and the TypeScript LSP.
  -- This ensures that they don't step on each other's toes.
  --
  -- @see https://deno.land/manual@v1.35.3/getting_started/setup_your_environment#neovim-06-using-the-built-in-language-server
  if vim.fn.executable('deno') == 1 then
    lsp_config['denols'].setup(extend_server_config({
      root_dir = lsp_config.util.root_pattern('deno.json', 'deno.jsonc')
    }))
  end

  if vim.fn.executable('elixir') == 1 then
    lsp_config['elixirls'].setup(extend_server_config())
  end

  if vim.fn.executable('go') == 1 then
    lsp_config['gopls'].setup(extend_server_config())
  end

  if vim.fn.executable('node') == 1 then
    lsp_config['svelte'].setup(extend_server_config())
    lsp_config['tailwindcss'].setup(extend_server_config())

    lsp_config['tsserver'].setup(extend_server_config({
      root_dir = lsp_config.util.root_pattern('package.json'),
      single_file_support = false
    }))
  end

  if vim.fn.executable('ocaml') == 1 then
    lsp_config['ocamllsp'].setup(extend_server_config({
      get_language_id = function(_, ftype)
        return ftype
      end
    }))
  end

  if vim.fn.executable('php') == 1 then
    lsp_config['intelephense'].setup(extend_server_config())
  end

  require('lsp_signature').setup({
    bind = true,
    handler_opts = { border = 'single' },
    hint_enable = false
  })
end

return M
