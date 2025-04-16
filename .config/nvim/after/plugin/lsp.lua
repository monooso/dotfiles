local function executable_exists(name)
    return vim.fn.executable(name) == 1
end

local function lsp_on_attach(client, bufnr)
    local wk = require('which-key')

    -- Jump to definition using <C-]>, just like with old-school tags.
    if client.server_capabilities.definitionProvider then
        vim.bo[bufnr].tagfunc = 'v:lua.vim.lsp.tagfunc'
    end

    -- Common LSP keybindings.
    wk.add({ {
        mode = { 'n' },
        { 'gd', require('telescope.builtin').lsp_definitions,     desc = 'List definitions' },
        { 'gi', require('telescope.builtin').lsp_implementations, desc = 'List implementations' },
        { 'gr', require('telescope.builtin').lsp_references,      desc = 'List references' }
    } })

    -- Show the available code actions if the LSP supports them.
    if client.server_capabilities.codeActionProvider then
        wk.add({
            {
                mode = { 'n' },
                -- Inspired by Zed.
                { 'g.', vim.lsp.buf.code_action, desc = 'Code actions' }
            }
        })
    end

    -- Use a shorter update time; otherwise we have to wait 4 seconds for the diagnostics to show.
    vim.o.updatetime = 250

    -- Show diagnostic messages for the current cursor position.
    -- If the diagnostic message is particularly long, you can focus the floating window with
    -- <C-w>w. Use the same command to return focus to the main window.
    local diagnostics_group = vim.api.nvim_create_augroup('DisplayDiagnotics', { clear = true })

    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        callback = function()
            -- Only display the diagnostics if we're not in 'insert' mode.
            -- Note that the appearance of the diagnostics window is defined in `after/plugin/diagnostic.lua`.
            -- TODO: Move the styling into `extend_server_config()`..? I have no idea what the consequences of this would be.
            if vim.api.nvim_get_mode().mode ~= 'i' then
                vim.diagnostic.open_float(nil)
            end
        end,
        group = diagnostics_group
    })
end

local function extend_server_config(config)
    local handlers = {
        ['textDocument/hover'] = vim.lsp.buf.hover(),
        ['textDocument/signatureHelp'] = vim.lsp.buf.signature_help(),
    }

    -- Tell the language servers that we support all the capabilities of `nvim-cmp`.
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

    return vim.tbl_deep_extend('force', {
        capabilities = lsp_capabilities,
        flags = { debounce_text_changes = 150 },
        handlers = handlers,
        on_attach = lsp_on_attach
    }, config or {})
end

-- Use Mason to manage the LSP servers.
require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })

-- Configure the LSP servers.
local lsp_config = require('lspconfig')

lsp_config['lua_ls'].setup(extend_server_config({
    diagnostics = { globals = { 'vim' } },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT'
            },
            workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                -- library = vim.api.nvim_get_runtime_file('', true)
            }
        }
    }
}))

-- As per the Deno documentation, check for specific files in the
-- root directory for both the Deno LSP and the TypeScript LSP.
-- This ensures that they don't step on each other's toes.
--
-- @see https://deno.land/manual@v1.35.3/getting_started/setup_your_environment#neovim-06-using-the-built-in-language-server
if executable_exists('deno') then
    lsp_config.denols.setup(extend_server_config({
        root_dir = lsp_config.util.root_pattern('deno.json', 'deno.jsonc')
    }))
end

if executable_exists('elixir') then
    lsp_config.elixirls.setup(extend_server_config())
end

if executable_exists('node') then
    lsp_config.astro.setup(extend_server_config())
    lsp_config.bashls.setup(extend_server_config())
    lsp_config.vimls.setup(extend_server_config())

    -- Phoenix makes life tricky, because it uses JavaScript, but may not have a `package.json` file.
    lsp_config.eslint.setup(extend_server_config({
        root_dir = lsp_config.util.root_pattern('mix.exs', 'package.json')
    }))

    -- Autocompletion of JSON properties.
    lsp_config.jsonls.setup(extend_server_config({
        settings = {
            json = {
                schemas = require('schemastore').json.schemas(),
                validate = { enable = true },
            },
        },
    }))

    lsp_config.tailwindcss.setup(extend_server_config({
        settings = {
            tailwindCSS = {
                includeLanguages = {
                    elixir = 'html-eex',
                    eelixir = 'html-eex',
                    heex = 'html-eex',
                },
            }
        }
    }))
end

if executable_exists('php') then
    lsp_config.intelephense.setup(extend_server_config({
        settings = {
            intelephense = {
                codeLens = {
                    implementations = { enable = true },
                    overrides = { enable = true },
                    parent = { enable = true },
                    references = { enable = true },
                    usages = { enable = true },
                }
            }
        }
    }))
end
