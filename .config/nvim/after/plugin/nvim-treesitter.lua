-- Configure the nvim-treesitter plugin.
--
-- @see https://github.com/nvim-treesitter/nvim-treesitter

-- Apparently we now have to specify all the languages, which is a complete PITA.
--
-- The library author is also of the opinion that countless people having identical
-- problems with the config changes is a problem with countless people, not the
-- ambiguous documentation, for example.
local filetypes = {
    'bash', 'css', 'eex', 'elixir', 'erlang', 'fish', 'go', 'heex', 'html',
    'javascript', 'json', 'lua', 'markdown', 'regex', 'tera', 'toml', 'typescript',
    'vim', 'vimdoc', 'xml', 'yaml'
}

require('nvim-treesitter').install(filetypes)

vim.api.nvim_create_autocmd('FileType', {
    pattern = filetypes,
    callback = function(opts)
        vim.treesitter.start()

        -- Enable indentation. Apparently this is now "experimental".
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
})
