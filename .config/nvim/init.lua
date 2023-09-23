-- <Space> is my leader. Set this before installing any plugins.
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Ensure everything is installed before proceeding.
require("monooso.bootstrap").setup()

-- Configure everything.
require("monooso.keymaps").setup()
require("monooso.ui").setup()
require("monooso.settings").setup()
require("monooso.treesitter").setup()
require("monooso.lsp").setup()
