local M = {}

M.setup = function()
  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      'bash',
      'css',
      'eex',
      'elixir',
      'erlang',
      'go',
      'heex',
      'html',
      'javascript',
      'json',
      'jsonc',
      'lua',
      'regex',
      'svelte',
      'toml',
      'tsx',
      'typescript',
      'vim',
      'yaml'
    },
    highlight = { enable = true },
    indent = { enable = true }
  })
end

return M
