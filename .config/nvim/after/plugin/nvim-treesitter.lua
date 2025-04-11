-- Context-aware commenting configuration.
-- @see https://github.com/JoosepAlviste/nvim-ts-context-commentstring/wiki/Integrations#native-commenting-in-neovim-010
-- require('ts_context_commentstring').setup {
--     enable_autocmd = false,
-- }
--
-- -- Tell Neovim to use the `commentstring` from Treesitter.
-- local original_get_option = vim.filetype.get_option
--
-- vim.filetype.get_option = function(filetype, option)
--     return option == 'commentstring'
--         and require('ts_context_commentstring.internal').calculate_commentstring()
--         or original_get_option(filetype, option)
-- end

-- General TreeSitter configuration.
require('nvim-treesitter.configs').setup({
    auto_install = true,
    ensure_installed = 'all',
    highlight = {
        enable = true
    },
    indent = {
        enable = true,
        disable = { 'yaml' }
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25,        -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false -- Whether the query persists across vim sessions
    },
    textobjects = {
        lsp_interop = {
            enable = true,
            border = 'none',
            floating_preview_opts = {},
            peek_definition_code = {
                ['<leader>df'] = '@function.outer',
                ['<leader>dc'] = '@class.outer',
            },
        },
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',

                -- We can't use `ap` and `ip`, because Vim already defines those
                -- (outer / inner paragraph, but you already knew that, right?).
                -- Instead we use `a`, for 'attribute'.
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
            }
        }
    }
})
