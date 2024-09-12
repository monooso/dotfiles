-- Ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end

-- Add lazy.nvim to the path
vim.opt.rtp:prepend(lazypath)

-- Install and configure plugins
require('lazy').setup({
    checker = { enabled = true },
    install = {
        colorscheme = { 'tokyonight-day' }
    },
    spec = {
        { import = 'plugins' }
    }
})
