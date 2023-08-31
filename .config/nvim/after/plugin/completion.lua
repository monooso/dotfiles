local cmp = require('cmp')

if cmp ~= nil then
  cmp.setup({
    completion = { completeopt = 'menu,menuone,noinsert' },
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
      { name = 'copilot', keyword_length = 2, max_item_count = 2 },
      { name = 'luasnip', keyword_length = 1, max_item_count = 4 },
      { name = 'nvim_lsp', keyword_length = 1 },
      { name = 'nvim_lua', keyword_length = 1 },
    })
  })
end
