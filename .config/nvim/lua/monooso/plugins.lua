-- Bootstrap the Lazy plugin manager.
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }

  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Install plugins.
require('lazy').setup({
    require 'monooso.plugins.conform',

    -- lazydev

    require 'monooso.plugins.fern',
    require 'monooso.plugins.luasnip',
    require 'monooso.plugins.mason',
    require 'monooso.plugins.mini',
    require 'monooso.plugins.nvim-lspconfig',
    
    require 'monooso.plugins.nvim-treesitter',

    -- telescope
        -- plenary
        -- telescope-fzf-native
        -- telescope-ui-select

    -- todo-comments
    -- vim-sleuth

    require 'monooso.plugins.which-key'
})
