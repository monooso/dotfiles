-- Configure the mini.snippets plugin, a LuaSnip replacement.
--
-- @see https://github.com/echasnovski/mini.nvim

local snippets = require('mini.snippets')
local loader = snippets.gen_loader

snippets.setup({
  snippets = {
    loader.from_file('~/.config/nvim/snippets/global.json'),
    loader.from_lang()
  }
})

-- Start the language server, for integration with mini.completion.
MiniSnippets.start_lsp_server()
