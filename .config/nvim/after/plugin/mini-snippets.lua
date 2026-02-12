-- Configure the mini.snippets plugin, for snippet management.
--
-- @see https://github.com/nvim-mini/mini.nvim

local gen_loader = require('mini.snippets').gen_loader

require('mini.snippets').setup({
  snippets = {
    -- Load custom file with global snippets first.
    gen_loader.from_file('~/.config/nvim/snippets/global.lua'),

    -- Load snippets for current language.
    gen_loader.from_lang(),
  },
})

MiniSnippets.start_lsp_server()
