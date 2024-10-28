require('nvim-treesitter.configs').setup({
    auto_install = true,
    ensure_installed = {
        'bash',
        'comment',
        'css',
        'diff',
        'dockerfile',
        'elixir',
        'erlang',
        'fish',
        'heex',
        'html',
        'javascript',
        'json',
        'jsonc',
        'lua',
        'markdown',
        'php',
        'phpdoc',
        'regex',
        'sql',
        'toml',
        'typescript',
        'xml',
        'yaml'
    },
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
    sync_install = true,
    textobjects = {
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
