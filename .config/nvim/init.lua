-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim and install packages
require("lazy").setup({
  spec = {
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "ricardoramirezr/blade-nav.nvim" }
  },
  checker = { enabled = true },
})

-- Install Intelephense using Mason
require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = true,
  ensure_installed = { "intelephense" }
})

-- Configure LSP
local lsp = require("lspconfig")
lsp["intelephense"].setup({
  capabilities = require("cmp_nvim_lsp").default_capabilities(),

  -- This ensures the Intelephense LSP is attached for Blade files,
  -- but does not result in the LSP actually working. Even when you
  -- set the filetype to "php".
  -- filetypes = { "blade", "php" }
})

-- Configure nvim-cmp
local cmp = require("cmp")
cmp.setup({
  sources = cmp.config.sources({ { name = "nvim_lsp" } })
})

-- Configure Blade Nav
require("blade-nav").setup()
