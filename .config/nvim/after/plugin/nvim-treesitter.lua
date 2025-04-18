-- Configure the nvim-treesitter plugin.
--
-- @see https://github.com/nvim-treesitter/nvim-treesitter

require('nvim-treesitter.configs').setup({
    auto_install = true,
    highlight = { enable = true },
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
