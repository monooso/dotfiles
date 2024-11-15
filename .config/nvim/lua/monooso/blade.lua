-- Set up TreeSitter for Blade files. This requires some additional work, as the Blade parser is
-- not currently supported by nvim-treesitter.
--
-- @see https://github.com/EmranMR/tree-sitter-blade/discussions/19

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

parser_config.blade = {
    install_info = {
        url = 'https://github.com/EmranMR/tree-sitter-blade',
        files = { 'src/parser.c' },
        branch = 'main',
    },
    filetype = 'blade'
}
