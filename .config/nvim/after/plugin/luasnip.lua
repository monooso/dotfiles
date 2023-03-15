local luasnip = require('luasnip')

luasnip.config.set_config({
  history = true,
  updateevents = 'TextChanged,TextChangedI'
})

-- Expand the snippet, or jump to the next placeholder.
vim.keymap.set({ 'i', 's' }, '<c-j>', function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, { silent = true })

-- Move to the previous placeholder.
vim.keymap.set({ 'i', 's' }, '<c-k>', function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true })

-- Select within a list of options.
vim.keymap.set('i', '<c-l>', function()
  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end)

-- Load our custom VSCode-style snippets.
require('luasnip.loaders.from_vscode').lazy_load({ paths = './snippets/' })
