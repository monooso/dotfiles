-- <Space> is my leader. Set this before installing any plugins.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

require('monooso.options')
require('monooso.keymaps')
require('monooso.lazy')
