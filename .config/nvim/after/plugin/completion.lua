local cmp = require("cmp")
local lspkind = require("lspkind")

if cmp ~= nil then
  cmp.setup({
    completion = { completeopt = "menu,menuone,noinsert" },
    formatting = {
      format = lspkind.cmp_format({ mode = "symbol_text" }),
    },
    mapping = cmp.mapping.preset.insert({
      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true
      })
    }),
    preselect = cmp.PreselectMode.Item,
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end
    },
    sorting = {
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      }
    },
    sources = cmp.config.sources({
      { name = "path" },
      { name = "luasnip", keyword_length = 1 },
      { name = "nvim_lsp", keyword_length = 1 },
      { name = "nvim_lua", keyword_length = 1 },
    })
  })
end
