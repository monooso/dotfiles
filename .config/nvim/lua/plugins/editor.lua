-- A bit of a catch-all, until I figure out how to organise everything.
return {
  -- Status line.
  { "nvim-lualine/lualine.nvim" },

  -- Sane terminals.
  {
    "akinsho/nvim-toggleterm.lua",
    opts = {
      direction = "vertical",
      size = 100,
      open_mapping = [[<C-\>]],
      shade_terminals = false,
    }
  },

  -- Treesitter.
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  },

  -- LSP, snippets, and autocompletion.
  { "neovim/nvim-lspconfig" },
  { "ray-x/lsp_signature.nvim" },

  -- Manage LSP servers.
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

  -- Completion sources.
  { "hrsh7th/nvim-cmp",                 dependencies = { "onsails/lspkind.nvim" } },
  { "hrsh7th/cmp-nvim-lsp" },
  { "saadparwaiz1/cmp_luasnip" },

  -- Code formatting.
  { "stevearc/conform.nvim" },

  -- Welcome our new robot overlords
  { "github/copilot.vim" },
}
