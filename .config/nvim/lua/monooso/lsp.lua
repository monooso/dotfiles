local M = {}

local function executable_exists(name)
    return vim.fn.executable(name) == 1
end

local function lsp_on_attach(client, bufnr)
    local wk = require('which-key')

    -- Jump to definition using <C-]>, just like with old-school tags.
    if client.server_capabilities.definitionProvider then
        vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
    end

    -- Show the available code actions.
    if client.server_capabilities.codeActionProvider then
        wk.add({
            {
                mode = { 'n' },
                { '<leader>c',  group = 'Code' },
                { '<leader>ca', vim.lsp.buf.code_action, desc = 'Actions' }
            }
        })
    end

    -- Use a shorter update time; otherwise we have to wait 4 seconds for the diagnostics to show.
    vim.o.updatetime = 250

    -- Show diagnostic messages for the current cursor position.
    -- If the diagnostic message is particularly long, you can focus the floating window with
    -- <C-w>w. Use the same command to return focus to the main window.
    local diagnostics_group = vim.api.nvim_create_augroup("DisplayDiagnotics", { clear = true })

    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        callback = function()
            -- Only display the diagnostics if we"re not in "insert" mode.
            -- Note that the appearance of the diagnostics window is defined in `after/plugin/diagnostic.lua`.
            -- TODO: Move the styling into `extend_server_config()`..? I have no idea what the consequences of this would be.
            if vim.api.nvim_get_mode().mode ~= "i" then
                vim.diagnostic.open_float(nil)
            end
        end,
        group = diagnostics_group
    })
end

local function extend_server_config(config)
    -- Show borders around the floating windows.
    local hover_opts = { border = "single", focusable = true }

    local handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, hover_opts),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, hover_opts)
    }

    -- Tell the language servers that we support all the capabilities of `nvim-cmp`.
    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

    return vim.tbl_deep_extend("force", {
        capabilities = lsp_capabilities,
        flags = { debounce_text_changes = 150 },
        handlers = handlers,
        on_attach = lsp_on_attach
    }, config or {})
end

M.setup = function()
    local lsp_config = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    -- Set up Mason and install the must-have language servers.
    local ensure_installed = {}

    if executable_exists("elixir") then
        table.insert(ensure_installed, "elixirls")
    end

    if executable_exists("node") then
        table.insert(ensure_installed, "bashls")
        table.insert(ensure_installed, "tailwindcss")
        table.insert(ensure_installed, "tsserver")
    end

    if executable_exists("php") then
        table.insert(ensure_installed, "intelephense")
    end

    mason.setup()
    mason_lspconfig.setup(ensure_installed)

    -- Set up and configure the language servers...
    lsp_config["lua_ls"].setup(extend_server_config({
        diagnostics = { globals = { "vim" } },
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT"
                },
                workspace = {
                    checkThirdParty = false,
                    library = { vim.env.VIMRUNTIME }
                    -- or pull in all of "runtimepath". NOTE: this is a lot slower
                    -- library = vim.api.nvim_get_runtime_file("", true)
                }
            }
        }
    }))

    -- As per the Deno documentation, check for specific files in the
    -- root directory for both the Deno LSP and the TypeScript LSP.
    -- This ensures that they don't step on each other's toes.
    --
    -- @see https://deno.land/manual@v1.35.3/getting_started/setup_your_environment#neovim-06-using-the-built-in-language-server
    if executable_exists("deno") then
        lsp_config["denols"].setup(extend_server_config({
            root_dir = lsp_config.util.root_pattern("deno.json", "deno.jsonc")
        }))
    end

    if executable_exists("elixir") then
        lsp_config["elixirls"].setup(extend_server_config())
    end

    if executable_exists("go") then
        lsp_config["gopls"].setup(extend_server_config())
    end

    if executable_exists("node") then
        lsp_config["astro"].setup(extend_server_config())
        lsp_config["bashls"].setup(extend_server_config())
        lsp_config["vimls"].setup(extend_server_config())
        lsp_config["svelte"].setup(extend_server_config())
        lsp_config["tsserver"].setup(extend_server_config({ single_file_support = false }))

        -- Phoenix makes life tricky, because it uses JavaScript, but may not have a `package.json` file.
        lsp_config["eslint"].setup(extend_server_config({
            root_dir = lsp_config.util.root_pattern("mix.exs", "package.json")
        }))

        lsp_config["tailwindcss"].setup(extend_server_config({
            settings = {
                tailwindCSS = {
                    includeLanguages = {
                        elixir = "html-eex",
                        eelixir = "html-eex",
                        heex = "html-eex",
                    },
                }
            }
        }))
    end

    if executable_exists("php") then
        lsp_config["intelephense"].setup(extend_server_config())
    end
end

return M
