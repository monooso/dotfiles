-- Install LuaSnip, a snippet engine.
--
-- @see https://github.com/L3MON4D3/LuaSnip

-- Required for snippet regex support.
local function build_luasnip()
  if vim.fn.executable 'make' == 0 then
    return
  end
  return 'make install_jsregexp'
end

return {
    'L3MON4D3/LuaSnip',
    build = build_luasnip(),
    event = 'VeryLazy',
    version = 'v2.*'
}
