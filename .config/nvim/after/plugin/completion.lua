local cmp = require('cmp')
local lspkind = require('lspkind')

if cmp ~= nil then
  cmp.setup({
    completion = { completeopt = 'menu,menuone,noinsert' },
    formatting = { format = lspkind.cmp_format() },
    mapping = cmp.mapping.preset.insert({
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true
      })
    }),
    preselect = cmp.PreselectMode.Item,
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end
    },
    sorting = {
      comparators = {
        cmp.config.compare.order,
      }
    },
    sources = cmp.config.sources({
      { name = 'path' },
      { name = 'luasnip', keyword_length = 2, max_item_count = 4 },
      { name = 'nvim_lsp', keyword_length = 3, max_item_count = 4 },
      { name = 'nvim_lua', keyword_length = 3, max_item_count = 4 },
      { name = 'copilot', keyword_length = 4, max_item_count = 3 },
    })
  })
end
